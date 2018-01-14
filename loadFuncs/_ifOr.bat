@echo off
::说明
::  if的or(或)表达式, 支持大于2个的条件
::  条件变量名必须为or1\or2\...当条件变量名与条件个数不一致时, 返回false标识
::参数
::  [flag] [conditionCount]
::      flag - 条件是否成立标识变量
::      conditionCount - 条件个数, 默认值为2
::调用方式
::  ------ demo.bat代码 ------
::      call loadF.bat _ifOr
::      set a=1& set b=1& set c=1
::      (set or1=%a%==1& set or2=%b%==1& set or3=%c%==2& call %_ifOr% flag 3)
::      if defined flag (echo true) else (echo false)
::  ------ demo.bat代码 ------
::  输出结果=====> true
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