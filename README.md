# Machine dependent programming languages
    2nd course, 4th semester

    Bauman Moscow State Technical University

| List of Labs  |     Stage     |      Task     |
| ------------- |:-------------:|:-------------:|
| Lab 1 |✓ |<a href="https://github.com/Panda-Lewandowski/Machine-dependent-programming-languages/wiki/Lab-1">wiki</a>|
| Lab 2| ✓ |<a href="https://github.com/Panda-Lewandowski/Machine-dependent-programming-languages/wiki/Lab-2">wiki</a>|
| Lab 3| ✓ |<a href="https://github.com/Panda-Lewandowski/Machine-dependent-programming-languages/wiki/Lab-3">wiki</a>|
| Lab 4| ✓ |<a href="https://github.com/Panda-Lewandowski/Machine-dependent-programming-languages/wiki/Lab-4">wiki</a>|
| Lab 5| ✓ |<a href="https://github.com/Panda-Lewandowski/Machine-dependent-programming-languages/wiki/Lab-4">wiki</a>|
| Lab 6| ✓ |<a href="https://github.com/Panda-Lewandowski/Machine-dependent-programming-languages/wiki/Lab-6">wiki</a>|
| Lab 7| ✓ |<a href="https://github.com/Panda-Lewandowski/Machine-dependent-programming-languages/wiki/Lab-7">wiki</a>|
|Factorial| ✓ |––|
|Transpose| ✓ |––|
|Sorting| ✓ |––|

<ul><li><i><b>Encoding:</b> Windows 1251 </i>
<li><i><b>Enviroment:</b>MS DOS, Windows XP</i>
<li><i><b>CV.exe</b> debugger</i>
<li><i><b>MASM.exe</b> assembler</i>
<li><i><b>AFD.exe</b> debugger</i>
<li><i><b>link.exe</b> linker, just linker</i>
<li><i><b>tasm32.exe</b> assembler, it can be used with Borland's high-level language compilers, such as Turbo Pascal, Turbo Basic, Turbo C and Turbo C++.</i></ul>

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
    
 <i>COMMENT: </i>Sorry, but tasks will be in Russian. I've no possibility to rewrite it in English.
