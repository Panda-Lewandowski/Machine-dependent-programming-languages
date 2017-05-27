// macrsasm.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"

extern "C"
{
	void LEN(int*); 
}


int _tmain(int argc, _TCHAR* argv[])
{
  int S1[20] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
   LEN(S1);

	return 0;
}

