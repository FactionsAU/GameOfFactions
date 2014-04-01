@echo off
cls
set /a c=0

setlocal ENABLEDELAYEDEXPANSION

 for %%f in (*.jar) do (
	set /a c=c+1
            echo !c!. %%~nf
    )
	set /p chose=Which bukkit do i run?
	
	set /a c=0

 for %%f in (*.jar) do (
	set /a c=c+1
            
			:start
			if %chose%==!c!  java -Xdebug -Xrunjdwp:transport=dt_socket,address=1000,server=y,suspend=n -Xms1024M -Xmx1024M -jar %%f -o true
			goto start
    )
	
endlocal

PAUSE