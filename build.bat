@echo off
del lex.yy.c
del a.exe
flex lex.l
gcc lex.yy.c -o a.exe
.\a.exe
