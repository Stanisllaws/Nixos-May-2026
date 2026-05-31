#include <stdio.h>
#include <stdlib.h>


int main(void){


int op ;
 
op = 0;
	
	
	
	printf("Just sleep op. 1\n");
        printf(" Shutdwon op. 2\n ");
	printf("Type anything to quit  ");

scanf("%d", &op);

switch(op){

	case 1:
        printf("sleep starts.");
	system("systemctl suspend");
	break;

        

	case 2:
	printf("would you like to shutdown.\n ");
	printf("yes type :1.\n ");
	printf("No type : 0 \n ");
        int x = 0;
	
	
         
        scanf(" %d", &x);
	if (x  == 1) {  
		printf(" shutdwon begin");
		system("shutdown");
        } else { printf("shuting down was canced");
	}
	break;


         

	


	default:
	printf("cancel exit");

}








return 0;
}
