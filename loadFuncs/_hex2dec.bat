@echo off& setlocal enabledelayedexpansion
::˵��
::  16����ת10����
::����
::  [hex in] [dec out]
::  hex - 16��������[�������]
::  dec - 10���Ʒ���ֵ����[�������]
::external
::  date       2018-01-15 14:34:21
::  face       *_*
::  weather    ����תС�� 15��/6�� ������
set _hex=%~1& set /a _dec=0, _hexIndex=0, _hexIndex2=-1, _power=0

:_loop
if !_hexIndex! EQU 0 (
    call set _hexCurChar=%%%_hex:~!_hexIndex2!%%%
) else (
    call set _hexCurChar=%%%_hex:~!_hexIndex2!,!_hexIndex!%%%
)
if "!_hexCurChar!" EQU "" endlocal& set %2=%_dec%& goto :EOF

for %%i in ("A=10" "B=11" "C=12" "D=13" "E=14" "F=15") do set _hexCurChar=!_hexCurChar:%%~i!
set _powerValue=1& for /l %%i in (1,1,!_power!) do set /a _powerValue*=16
set /a _dec+=_hexCurChar*_powerValue, _hexIndex-=1, _hexIndex2=_hexIndex-1, _power+=1
goto :_loop