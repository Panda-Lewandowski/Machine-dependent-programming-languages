// lab10.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"

extern "C" int DlinaStroki(char *s);
extern "C" char *CopyStr(char *s1, char *s2, int L);

int _tmain(int argc, _TCHAR* argv[])
{
	char source[] = "Hello world!";
	int n = DlinaStroki(source);
	char *res = CopyStr(source, source+6, 5);
	return 0;
}

