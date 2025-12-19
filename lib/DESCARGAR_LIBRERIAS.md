# Instrucciones para descargar las librerías necesarias

Este archivo contiene las instrucciones para descargar las librerías JFlex y Cup necesarias para compilar el proyecto.

## Librerías necesarias

Coloca los siguientes archivos JAR en esta carpeta `lib/`:

### 1. JFlex (Generador de Analizadores Léxicos)

**Descarga:** https://jflex.de/download.html

Archivo necesario:
- `jflex-full-1.9.1.jar` (o versión más reciente)

### 2. Cup (Generador de Parsers)

**Descarga:** http://www2.cs.tum.edu/projects/cup/

O alternativamente: https://github.com/vbmacher/cup-maven-plugin/releases

Archivos necesarios:
- `java-cup-11b.jar`
- `java-cup-11b-runtime.jar`

## Estructura final de la carpeta lib/

```
lib/
├── jflex-full-1.9.1.jar
├── java-cup-11b.jar
└── java-cup-11b-runtime.jar
```

## Enlaces directos de descarga (verificar disponibilidad)

### JFlex
```
https://github.com/jflex-de/jflex/releases/download/v1.9.1/jflex-1.9.1.tar.gz
```

### Cup
```
http://www2.cs.tum.edu/projects/cup/java-cup-bin-11b-20160615.tar.gz
```

## Verificación

Después de descargar los archivos, verifica que estén correctamente ubicados ejecutando:

```powershell
dir lib
```

Deberías ver los 3 archivos JAR listados.

## Problemas comunes

**Error: No se encuentra el archivo JAR**
- Asegúrate de que los nombres de los archivos coincidan exactamente con los usados en los scripts
- Si tienes una versión diferente de JFlex, actualiza el nombre en `compilar.bat`

**Error: java.lang.ClassNotFoundException**
- Verifica que `java-cup-11b-runtime.jar` esté presente
- Este archivo es necesario tanto para compilar como para ejecutar el proyecto
