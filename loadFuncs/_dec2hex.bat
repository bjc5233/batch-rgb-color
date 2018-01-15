@echo off& setlocal enabledelayedexpansion
::说明
::  10进制转16进制
::参数
::  [dec in] [hex out]
::  dec - 10进制数字[输入参数]
::  hex - 16进制返回值变量[输出参数]
::external
::  date       2018-01-15 14:25:47
::  face       ←_←
::  weather    多云转小雨 15℃/6℃ 东北风
set _hexStr=0123456789ABCDEF& set _hex=& set /a _dec=%~1

:_loop
set /a _mod=!_dec!%%16, _dec/=16
call set _hex=%%_hexStr:~!_mod!,1%%!_hex!
if !_dec! NEQ 0 goto :_loop
endlocal& set %2=%_hex%& goto :EOF