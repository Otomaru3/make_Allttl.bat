@echo off 

cd /d %~dp0

rem ### 出力するファイル名を設定する
set OutputFile=_ALLTTL.bat

rem ### 無視する.ttlファイルを設定する
set IgnoreFile=_ignored.ttl

rem ### 各.ttlファイルを実行するまでの遅延時間の設定するプロンプト
set /p INPUTSTR="Set delay time in second: "

echo rem Made with %0 > %OutputFile%
echo pause > %OutputFile%

for %%f in (*.ttl) do (
    if not %%f==%IgnoreFile% (
        echo start %%f >> %OutputFile%
        echo timeout /t %INPUTSTR% >> %OutputFile%
    )
)
