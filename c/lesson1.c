/* compile it with gcc --pedantic-errors lesson1.c*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int x=10;
	auto void bar(void);
	void foo()
	{
		printf("Hello\n");
		bar();
	}
	int y=20;
	void bar()
	{
		printf("World\n");
	}
	foo();
	return 0;
}
