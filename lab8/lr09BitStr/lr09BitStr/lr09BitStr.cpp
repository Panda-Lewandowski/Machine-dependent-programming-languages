// lr09BitStr.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
extern "C" void START();

int _tmain(int argc, _TCHAR* argv[])
{

	_asm
	{
		call START
	}

	return 0;
}

