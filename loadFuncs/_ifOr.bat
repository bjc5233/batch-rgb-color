@echo off
::˵��
::  if��or(��)���ʽ, ֧�ִ���2��������
::  ��������������Ϊor1\or2\...������������������������һ��ʱ, ����false��ʶ
::����
::  [flag] [conditionCount]
::      flag - �����Ƿ������ʶ����
::      conditionCount - ��������, Ĭ��ֵΪ2
::���÷�ʽ
::  ------ demo.bat���� ------
::      call loadF.bat _ifOr
::      set a=1& set b=1& set c=1
::      (set or1=%a%==1& set or2=%b%==1& set or3=%c%==2& call %_ifOr% flag 3)
::      if defined flag (echo true) else (echo false)
::  ------ demo.bat���� ------
::  ������=====> true
if "%1"=="" goto :EOF
if "%2"=="" (set conditionCount=2) else (set conditionCount=%2)
set %1=
set _ifOrTemp=%temp%\_ifOr%conditionCount%.bat
if not exist "%_ifOrTemp%" (
    (
        echo @echo off
        echo set _if_or_flag=0
        for /l %%i in (1,1,%conditionCount%) do (echo if not defined or%%i goto :EOF)
        for /l %%i in (1,1,%conditionCount%) do (echo if %%or%%i%% set _if_or_flag=1)
        echo ^(if %%_if_or_flag%%==1 set "%%1=1"^)^& goto :EOF
    )>%_ifOrTemp%
)
call %_ifOrTemp% %1