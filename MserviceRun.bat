c:\Mterminalservice\mterminalservice.exe
for /d %%d in ("c:\Mterminalservice\Db*.*") do (move "%%~d" "c:\Mterminalservice\archive")

rem pause