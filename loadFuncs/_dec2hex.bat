@echo off& setlocal enabledelayedexpansion
::˵��
::  10����ת16����
::����
::  [dec in] [hex out]
::  dec - 10��������[�������]
::  hex - 16���Ʒ���ֵ����[�������]
::external
::  date       2018-01-15 14:25:47
::  face       ��_��
::  weather    ����תС�� 15��/6�� ������
set _hexStr=0123456789ABCDEF& set _hex=& set /a _dec=%~1

:_loop
set /a _mod=!_dec!%%16, _dec/=16
call set _hex=%%_hexStr:~!_mod!,1%%!_hex!
if !_dec! NEQ 0 goto :_loop
endlocal& set %2=%_hex%& goto :EOF