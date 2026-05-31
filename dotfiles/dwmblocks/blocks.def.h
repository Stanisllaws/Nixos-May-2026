//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
        /*Icon*/        /*Command*/             /*Update Interval*/        /*Update Signal*/
        {"🔋 ", "cat /sys/class/power_supply/BAT0/capacity",                5,               0},

        {"🧠 ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g", 30,             0},

        {"🔊 ", "amixer get Master | tail -n1 | sed -r 's/.*\\[(.*)%\\].*/\\1/'", 60, 0},

        {"📅 ", "date '+%b %d (%a) %I:%M%p'",                5,               0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
