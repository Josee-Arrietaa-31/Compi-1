@echo off
echo ================================================
echo DESCARGA DE LIBRERIAS - Analizador Lexico
echo ================================================
echo.
echo Este script te guiara para descargar las librerias necesarias.
echo.
echo OPCION 1 - Descarga Automatica (requiere internet):
echo -----------------------------------------------
echo.
echo :: JFlex
powershell -Command "Write-Host 'Descargando JFlex...' -ForegroundColor Cyan; try { $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://github.com/jflex-de/jflex/releases/download/v1.9.1/jflex-full-1.9.1.jar' -OutFile 'lib/jflex-full-1.9.1.jar' -UseBasicParsing; Write-Host 'JFlex descargado correctamente!' -ForegroundColor Green } catch { Write-Host 'Error al descargar JFlex' -ForegroundColor Red }"
echo.

echo :: Cup
powershell -Command "Write-Host 'Descargando Cup (java-cup-11b.jar)...' -ForegroundColor Cyan; try { $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://github.com/vbmacher/cup-maven-plugin/releases/download/1.1-b20160615/java-cup-11b.jar' -OutFile 'lib/java-cup-11b.jar' -UseBasicParsing; Write-Host 'Cup descargado correctamente!' -ForegroundColor Green } catch { Write-Host 'Error al descargar Cup' -ForegroundColor Red }"
echo.

powershell -Command "Write-Host 'Descargando Cup Runtime (java-cup-11b-runtime.jar)...' -ForegroundColor Cyan; try { $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://github.com/vbmacher/cup-maven-plugin/releases/download/1.1-b20160615/java-cup-11b-runtime.jar' -OutFile 'lib/java-cup-11b-runtime.jar' -UseBasicParsing; Write-Host 'Cup Runtime descargado correctamente!' -ForegroundColor Green } catch { Write-Host 'Error al descargar Cup Runtime' -ForegroundColor Red }"
echo.

echo ================================================
echo Verificando archivos descargados...
echo ================================================
dir lib\*.jar
echo.

echo ================================================
echo OPCION 2 - Descarga Manual:
echo ================================================
echo.
echo Si la descarga automatica fallo, descarga manualmente:
echo.
echo 1. JFlex:
echo    URL: https://github.com/jflex-de/jflex/releases/download/v1.9.1/jflex-full-1.9.1.jar
echo    Guardar en: lib\jflex-full-1.9.1.jar
echo.
echo 2. Cup:
echo    URL: https://github.com/vbmacher/cup-maven-plugin/releases/download/1.1-b20160615/java-cup-11b.jar
echo    Guardar en: lib\java-cup-11b.jar
echo.
echo 3. Cup Runtime:
echo    URL: https://github.com/vbmacher/cup-maven-plugin/releases/download/1.1-b20160615/java-cup-11b-runtime.jar
echo    Guardar en: lib\java-cup-11b-runtime.jar
echo.
echo ================================================
pause
