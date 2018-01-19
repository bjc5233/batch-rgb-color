@echo off& call loadE imagemagick-convert
::说明
::  获取图片主色
::参数
::  imgPath R G B
::      imgPath - 图片路径[输入参数]
::      R - 红色代码[输出参数]
::      G - 绿色代码[输出参数]
::      B - 蓝色代码[输出参数]
::external
::  date       2018-01-15 22:32:26
::  face       555~
::  weather    多云转小雨 15℃/10℃ 风
set imgPath=%~1
if not exist "%imgPath%" goto :EOF
for /f "tokens=2,3,4 delims=^(,^)" %%i in ('%imagemagick-convert% "%imgPath%" -scale 1x1 -format %%[pixel:u] info:-') do set %2=%%i& set %3=%%j& set %4=%%k