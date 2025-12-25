@echo off
echo ================================================
echo Ejecutando Analizador Lexico
echo ================================================
echo.

if "%1"=="" (
    echo Uso: ejecutar.bat ^<archivo_entrada^> [archivo_salida]
    echo.
    echo Ejemplos:
    echo   ejecutar.bat input/ejemplo1.txt
    echo   ejecutar.bat input/simple.txt output/resultado.txt
    echo   ejecutar.bat input/ejemplo_errores.txt
    echo.
    pause
    exit /b 1
)

if not exist "%1" (
    echo ERROR: El archivo "%1" no existe.
    echo.
    pause
    exit /b 1
)

echo Analizando archivo: %1
echo.

java -cp "lib/java-cup-11b-runtime.jar;." Main %1 %2

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR durante la ejecucion.
    pause
    exit /b 1
)

echo.
echo ================================================
echo Analisis completado!
echo ================================================
pause
