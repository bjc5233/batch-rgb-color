@echo off
::˵��
::  if��and(��)���ʽ, ֧�ִ���2��������
::  ��������������Ϊand1\and2\...������������������������һ��ʱ, ����false��ʶ
::����
::  [flag] [conditionCount]
::      flag - �����Ƿ������ʶ����
::      conditionCount - ��������, Ĭ��ֵΪ2
::���÷�ʽ
::  ------ demo.bat���� ------
::      call loadF.bat _ifAnd
::      set a=1& set b=1& set c=1
::      (set and1=%a%==1& set and2=%b%==1& set and3=%c%==2& call %_ifAnd% flag 3)
::      if defined flag (echo true) else (echo false)
::  ------ demo.bat���� ------
::  ������=====> true

if "%1"=="" goto :EOF
if "%2"=="" (set conditionCount=2) else (set conditionCount=%2)
set %1=
set _ifAndTemp=%temp%\_ifAnd%conditionCount%.bat
if not exist "%_ifAndTemp%" (
    (
        echo @echo off
        echo set _if_and_flag=0
        for /l %%i in (1,1,%conditionCount%) do (echo if not defined and%%i goto :EOF)
        for /l %%i in (1,1,%conditionCount%) do (set /p"=if %%and%%i%% "<nul)
        echo set _if_and_flag=1
        echo ^(if %%_if_and_flag%%==1 set "%%1=1"^)^& goto :EOF
    )>%_ifAndTemp%
)
call %_ifAndTemp% %1