#include <stdio.h>
void Compare(int b1, int h1, int b2, int h2);
int Area(int b, int h);
int main(int argc, char **argv)
{
int base1, base2, height1, height2;
	printf("Enter base for triangle1: ");
	scanf("%d", &base1);
	printf("Enter height for triangle1: ");
	scanf("%d", &height1);
	printf("Enter base for triangle2: ");
	scanf("%d", &base2);
	printf("Enter height for triangle2: ");
	scanf("%d", &height2);
	
	Compare(base1, height1, base2, height2);
return 0;
}

void Compare(int b1, int h1, int b2, int h2)
{
	int A1=Area(b1, h1);
	int A2=Area(b2, h2);
	printf("Area1 =%d\n" , A1);
	printf("Area2 =%d\n" , A2);

	if (A1 == A2)
		printf("Area1 equals Area2.\n");
	else if (A1 > A2)
		printf("Area1 is greater than Area2.\n");
	else
		printf("Area2 is greater tha Area1.\n");
}

int Area(int b, int h)
{
	int A=(b*h)/2;
return A;
}
