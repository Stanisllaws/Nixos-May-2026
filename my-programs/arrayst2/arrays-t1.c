#include <stdio.h>

int main(void) {

int ocena[10];
int count = 10;
long suma = 0;
float average = 0.0f;

printf("\n Wpisze 10 ocen\n");


for(int i = 0 ; i < count ; ++i)
{
	printf("%2u> " ,i + 1 );
	scanf("%d", &ocena[i]);
	suma += ocena[i];

}

average = (float)suma/count;

printf("\n Srednia dziesiecui ocen jest %.2f\n", average);

return 0;





























}
