@echo off
del lex.yy.c
del project.tab.h
del project.tab.c
flex project.l
bison -d project.y
gcc lex.yy.c project.tab.c -lfl -ly
.\a.exe
