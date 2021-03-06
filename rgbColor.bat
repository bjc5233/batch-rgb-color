@echo off& call load.bat _getDeskWallpaperPath _getConsoleCurColor _getRandomNum _parseJSON& call loadF.bat _params _errorMsg _ifOr _dec2hex _hex2dec _imgDominantColor _help& setlocal enabledelayedexpansion
:::说明
:::  动态修改当前字体颜色槽为指定的RGB颜色
:::参数
:::  mode [R] [G] [B]
:::      mode - 模式[0\color] [1\random] [2\desk] [3\default] 默认值为1
:::             0\color - specifiedColor需要指定RGB值
:::             1\random - randomColor随机颜色
:::             2\desk - deskWallpaperColor桌面壁纸主色
:::             3\default - defaultColor重置默认颜色
:::      R - 红色代码[0-255], mode值为0时传递, 无则自动生成随机值
:::      G - 绿色代码[0-255], mode值为0时传递, 无则自动生成随机值
:::      B - 蓝色代码[0-255], mode值为0时传递, 无则自动生成随机值
:::  [-h help]
:::      help - 打印注释信息
:::external
:::  date       2018-01-15  2:18:28
:::  face       555~
:::  weather    多云转小雨 15℃/6℃ 风

::========================= set user param =========================
call %_params% %*
if defined _param-h (call %_help% "%~f0"& goto :EOF)
if defined _param-help (call %_help% "%~f0"& goto :EOF)
if defined _param-0 (
    set mode=%_param-0%
    (if /i !mode!==color set mode=0)& (if /i !mode!==random set mode=1)& (if /i !mode!==desk set mode=2)& (if /i !mode!==default set mode=3)
    (set or1=!mode! LSS 0& set or2=!mode! GTR 3& call %_ifOr% flag 2)
    if defined flag (call %_errorMsg% %0 "mode MUST IN [0\color] [1\random] [2\desk] [3\default]")
) else (
    set mode=1
)



::========================= calc rgb color =========================
if !mode! EQU 0 (
    if defined _param-1 (
        set rColor=%_param-1%
        (set or1=!rColor! LSS 0& set or2=!rColor! GTR 255& call %_ifOr% flag)
        if defined flag (call %_errorMsg% %0 "rColor MUST BETWEEN 0 AND 255")
    ) else (
        (%_call% ("0 255 rColor") %_getRandomNum%)
    )
    if defined _param-2 (
        set gColor=%_param-2%
        (set or1=!gColor! LSS 0& set or2=!gColor! GTR 255& call %_ifOr% flag)
        if defined flag (call %_errorMsg% %0 "gColor MUST BETWEEN 0 AND 255")
    ) else (
        (%_call% ("0 255 gColor") %_getRandomNum%)
    )
    if defined _param-3 (
        set bColor=%_param-3%
        (set or1=!bColor! LSS 0& set or2=!bColor! GTR 255& call %_ifOr% flag)
        if defined flag (call %_errorMsg% %0 "bColor MUST BETWEEN 0 AND 255")
    ) else (
        (%_call% ("0 255 bColor") %_getRandomNum%)
    )
) 
if !mode! EQU 1 (
    (%_call% ("0 255 rColor") %_getRandomNum%)
    (%_call% ("0 255 gColor") %_getRandomNum%)
    (%_call% ("0 255 bColor") %_getRandomNum%)
)
if !mode! EQU 2 (
    (%_call% ("deskWallpaperPath") %_getDeskWallpaperPath%)
    (call %_imgDominantColor% "!deskWallpaperPath!" rColor gColor bColor)
)
if !mode! EQU 3 (
    call :getColorTableIndex colorTableIndex
    call :getDefaultColorTableValue !colorTableIndex! defaultColorTableValue
    call :setColorTable !colorTableIndex! !defaultColorTableValue!
    goto :EOF
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