@echo off& call loadE imagemagick-convert
::˵��
::  ��ȡͼƬ��ɫ
::����
::  imgPath R G B
::      imgPath - ͼƬ·��[�������]
::      R - ��ɫ����[�������]
::      G - ��ɫ����[�������]
::      B - ��ɫ����[�������]
::external
::  date       2018-01-15 22:32:26
::  face       555~
::  weather    ����תС�� 15��/10�� ��
set imgPath=%~1
if not exist "%imgPath%" goto :EOF
for /f "tokens=2,3,4 delims=^(,^)" %%i in ('%imagemagick-convert% "%imgPath%" -scale 1x1 -format %%[pixel:u] info:-') do set %2=%%i& set %3=%%j& set %4=%%k