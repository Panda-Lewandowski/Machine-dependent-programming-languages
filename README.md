# Machine dependent programming languages
    2nd course, 4th semester

    Bauman Moscow State Technical University

| List of Labs  |     Stage     |      Task     |
| ------------- |:-------------:|:-------------:|
| Lab 1 |✓ |<a href="/wiki/Lab-1">wiki</a>|
| Lab 2| ✓ |<a href="/wiki/Lab-2">wiki</a>|
| Lab 3| ✓ |<a href="/wiki/Lab-2">wiki</a>|
| Lab 4| ✓ ||
| Lab 5| ✓ ||
| Lab 6| ✓ ||
| Lab 7|  ||
|Factorial| ✓ ||
|Transpose| ✓ ||

<ul><li><i><b>Encoding:</b> Windows 1251 </i>
<li><i><b>Enviroment:</b>MS DOS, Windows XP</i>
<li><i><b>CV.exe</b> debugger</i>
<li><i><b>MASM.exe</b> assembler</i>
<li><i><b>AFD.exe</b> debugger</i>
<li><i><b>link.exe</b> linker, just linker</i></ul>

<i><b>Example of "make"-like bat file</b>( `/zi` and `/co` are required for CV)</i>

    masm /zi l6.asm,,;
    masm /zi _enter.asm,,;
    masm /zi _out2.asm,,;
    masm /zi _out2s.asm,,;
    masm /zi _out10.asm,,;
    masm /zi _out10s.asm,,;
    masm /zi _out16.asm,,;
    masm /zi _out16s.asm,,;
    masm /zi _print.asm,,;
    link /co l6.obj _enter.obj _print.obj _out2.obj _out2s.obj _out10.obj _out10s.obj _out16.obj _out16s.obj,,,;
    pause
    
<i><b>Example of "run" bat file</b></i>

    cv main.exe
    pause
