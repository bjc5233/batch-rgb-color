@echo off& call load.bat _getConsoleCurColor _getRandomNum _parseJSON& call loadF.bat _params _errorMsg _ifOr _dec2hex _hex2dec& setlocal enabledelayedexpansion
::˵��
::  ��̬�޸ĵ�ǰ������ɫ��Ϊָ����RGB��ɫ
::����
::  R G B [-d default]
::  R - ��ɫ����[0-255], �����Զ��������ֵ
::  G - ��ɫ����[0-255], �����Զ��������ֵ
::  B - ��ɫ����[0-255], �����Զ��������ֵ
::  default - ������ɫ����Ϊԭʼ��ɫ
::ע��
::  ����default������flag�Ͳ�������˱���ŵ������б����
::external
::  date       2018-01-15  2:18:28
::  face       555~
::  weather    ����תС�� 15��/6�� ��


::========================= set user param =========================
call %_params% %*
if defined _param-d (
    call :getColorTableIndex colorTableIndex
    call :getDefaultColorTableValue !colorTableIndex! defaultColorTableValue
    call :setColorTable !colorTableIndex! !defaultColorTableValue!
    goto :EOF
)
if defined _param-0 (
    set rColor=%_param-0%
    (set or1=!rColor! LSS 0& set or2=!rColor! GTR 255& call %_ifOr% flag)
    if defined flag (call %_errorMsg% %0 "rColor MUST BETWEEN 0 AND 255")
) else (
    (%_call% ("0 255 rColor") %_getRandomNum%)
)
if defined _param-1 (
    set gColor=%_param-1%
    (set or1=!gColor! LSS 0& set or2=!gColor! GTR 255& call %_ifOr% flag)
    if defined flag (call %_errorMsg% %0 "gColor MUST BETWEEN 0 AND 255")
) else (
    (%_call% ("0 255 gColor") %_getRandomNum%)
)
if defined _param-2 (
    set bColor=%_param-2%
    (set or1=!bColor! LSS 0& set or2=!bColor! GTR 255& call %_ifOr% flag)
    if defined flag (call %_errorMsg% %0 "bColor MUST BETWEEN 0 AND 255")
) else (
    (%_call% ("0 255 bColor") %_getRandomNum%)
)


::========================= processing =========================
call :10to16 !rColor! rColorHex
call :10to16 !gColor! gColorHex
call :10to16 !bColor! bColorHex
call :getColorTableIndex colorTableIndex
call :setColorTable !colorTableIndex! !bColorHex!!gColorHex!!rColorHex!
goto :EOF



::========================= functions =========================
:10to16
call %_dec2hex% %1 colorHex
if "!colorHex:~1,1!"=="" set colorHex=0!colorHex!
set %2=!colorHex!
goto :EOF


:getColorTableIndex
(%_call% ("curColorStr") %_getConsoleCurColor%)
set curColorStr=%curColorStr:0x=%& set curFontColor=!curColorStr:~-1!
call %_hex2dec% %curFontColor% colorTableIndex
if !colorTableIndex! LEQ 9 set colorTableIndex=0!colorTableIndex!
set %1=!colorTableIndex!
goto :EOF


:setColorTable
reg add "HKEY_CURRENT_USER\Console" /v ColorTable%1 /t REG_DWORD /f /d 0x00%2 >nul 2>nul
goto :EOF


:getDefaultColorTableValue
set defaultColor={00:000000,01:800000,02:008000,03:808000,04:000080,05:800080,06:008080,07:c0c0c0,08:808080,09:ff0000,10:00ff00,11:ffff00,12:0000ff,13:ff00ff,14:00ffff,15:ffffff}
(%_call% ("defaultColor") %_parseJSON%)
set %2=!defaultColor.%1!
goto :EOF