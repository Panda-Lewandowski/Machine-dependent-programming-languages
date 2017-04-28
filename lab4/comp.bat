@echo off

masm /zi 4-1,,,,;
masm /zi 4-2,,,,;
link /co 4-1 4-2,,,,;
4-1.exe