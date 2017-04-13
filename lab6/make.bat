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