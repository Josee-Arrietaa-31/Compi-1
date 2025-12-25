@echo off
echo ================================================
echo Compilador - Analizador Lexico
echo ================================================
echo.

echo [1/3] Generando parser con Cup...
java -jar lib/java-cup-11b.jar -destdir src parser.cup
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Fallo al generar el parser
    pause
    exit /b 1
)
echo Parser generado correctamente.
echo.

echo [2/3] Generando scanner con JFlex...
java -jar lib/jflex-full-1.9.1.jar -d src scanner.flex
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Fallo al generar el scanner
    pause
    exit /b 1
)
echo Scanner generado correctamente.
echo.

echo [3/3] Compilando proyecto Java...
javac -cp "lib/java-cup-11b-runtime.jar;." -d . src/*.java
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Fallo al compilar el proyecto
    pause
    exit /b 1
)
echo Proyecto compilado correctamente.
echo.

echo ================================================
echo Compilacion exitosa!
echo ================================================
echo.
echo Para ejecutar: java -cp "lib/java-cup-11b-runtime.jar;." Main input/ejemplo1.txt
echo.
pause
