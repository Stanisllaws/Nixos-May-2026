{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  environment.systemPackages = [
    (pkgs.writeShellApplication {
      name = "wifi-m";

      runtimeInputs = with pkgs; [
        networkmanager
        rofi
        libnotify
        gnugrep
        gawk
        coreutils
      ];

      text = ''
        SESSION_TYPE="$XDG_SESSION_TYPE"
        ENABLED_COLOR="#A3BE8C"
        DISABLED_COLOR="#D35F5E"

        SIGNAL_ICONS=("󰤟 " "󰤢 " "󰤥 " "󰤨 ")
        SECURED_SIGNAL_ICONS=("󰤡 " "󰤤 " "󰤧 " "󰤪 ")

        WIFI_CONNECTED_ICON=" "
        ETHERNET_CONNECTED_ICON=" "

        get_wifi_device() {
          nmcli -t -f DEVICE,TYPE device | grep ":wifi" | cut -d: -f1 | head -n1
        }

        get_status() {
          if nmcli -t -f TYPE,STATE device status | grep 'ethernet:connected' >/dev/null; then
            icon="󰈀"
            color="$ENABLED_COLOR"

          elif nmcli -t -f TYPE,STATE device status | grep 'wifi:connected' >/dev/null; then
            wifi_info=$(nmcli -t -f IN-USE,SIGNAL,SECURITY,SSID device wifi list --rescan no | grep '^\*')

            if [ -n "$wifi_info" ]; then
              IFS=: read -r _ signal security _ <<< "$wifi_info"

              level=$((signal / 25))
              [ "$level" -gt 3 ] && level=3

              icon="\${SIGNAL_ICONS[\$level]}"
              [[ "\$security" =~ WPA|WEP ]] && icon="\${SECURED_SIGNAL_ICONS[\$level]}"

              color="$ENABLED_COLOR"
            else
              icon=" "
              color="$DISABLED_COLOR"
            fi
          else
            icon=" "
            color="$DISABLED_COLOR"
          fi

          if [[ "$SESSION_TYPE" == "wayland" ]]; then
            echo "<span color=\"$color\">\$icon</span>"
          else
            echo "%{F$color}\$icon%{F-}"
          fi
        }

        manage_wifi() {
          wifi_dev=$(get_wifi_device)

          mapfile -t lines < <(nmcli -t -f IN-USE,SIGNAL,SECURITY,SSID device wifi list)

          entries=()
          ssids=()
          active=""

          for line in "\${lines[@]}"; do
            IFS=: read -r in_use signal security ssid <<< "\$line"
            [ -z "\$ssid" ] && continue

            level=$((signal / 25))
            [ "$level" -gt 3 ] && level=3

            icon="\${SIGNAL_ICONS[\$level]}"
            [[ "\$security" =~ WPA|WEP ]] && icon="\${SECURED_SIGNAL_ICONS[\$level]}"

            label="\$icon \$ssid"

            if [[ "\$in_use" == "*" ]]; then
              active="\$ssid"
              label="\$WIFI_CONNECTED_ICON \$label"
            fi

            entries+=("\$label")
            ssids+=("\$ssid")
          done

          choice=$(printf "%s\n" "\${entries[@]}" | rofi -dmenu -i -p "Wi-Fi")
          [ -z "\$choice" ] && exit 0

          for i in "\${!entries[@]}"; do
            [[ "\${entries[\$i]}" == "\$choice" ]] && idx=\$i
          done

          ssid="\${ssids[\$idx]}"

          if [[ "\$ssid" == "\$active" ]]; then
            action=$(printf "Disconnect\nForget" | rofi -dmenu -p "Action")
          else
            action=$(printf "Connect\nForget" | rofi -dmenu -p "Action")
          fi

          case "\$action" in
            Connect)
              if nmcli -g NAME connection show | grep -Fx "\$ssid"; then
                nmcli connection up id "\$ssid" && notify-send "Connected" "\$ssid"
              else
                pass=$(rofi -dmenu -password -p "Password")
                nmcli device wifi connect "\$ssid" password "\$pass" && notify-send "Connected" "\$ssid"
              fi
              ;;
            Disconnect)
              nmcli device disconnect "\$wifi_dev" && notify-send "Disconnected" "\$ssid"
              ;;
            Forget)
              nmcli connection delete id "\$ssid" && notify-send "Forgotten" "\$ssid"
              ;;
          esac
        }

        manage_ethernet() {
          mapfile -t devs < <(nmcli -t -f DEVICE,TYPE,STATE device | grep ethernet)

          entries=()

          for d in "\${devs[@]}"; do
            IFS=: read -r dev _ state <<< "\$d"

            label="\$dev"
            [[ "\$state" == "connected" ]] && label="\$ETHERNET_CONNECTED_ICON\$dev"

            entries+=("\$label")
          done

          choice=$(printf "%s\n" "\${entries[@]}" | rofi -dmenu -p "Ethernet")
          [ -z "\$choice" ] && exit 0

          dev=$(echo "\$choice" | sed "s/\$ETHERNET_CONNECTED_ICON//")

          state=$(nmcli -t -f DEVICE,STATE device | grep "^$dev:" | cut -d: -f2)

          if [[ "\$state" == "connected" ]]; then
            nmcli device disconnect "\$dev"
            notify-send "Disconnected" "\$dev"
          else
            nmcli device connect "\$dev"
            notify-send "Connected" "\$dev"
          fi
        }

        main() {
          if [[ "$1" == "--status" ]]; then
            get_status
            exit 0
          fi

          wifi_state=$(nmcli -fields WIFI g)

          if [[ "$wifi_state" =~ enabled ]]; then
            toggle="Disable Wi-Fi"
            action="off"
            wifi_menu="Manage Wi-Fi"
          else
            toggle="Enable Wi-Fi"
            action="on"
            wifi_menu=""
          fi

          choice=$(printf "%s\n%s\nManage Ethernet" "$toggle" "$wifi_menu" | rofi -dmenu -p "Network")

          case "$choice" in
            "$toggle")
              nmcli radio wifi "$action"
              ;;
            "Manage Wi-Fi")
              manage_wifi
              ;;
            "Manage Ethernet")
              manage_ethernet
              ;;
          esac
        }

        main "$@"
      '';
    })
  ];
}
