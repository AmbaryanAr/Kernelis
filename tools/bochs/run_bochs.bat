@echo off
setlocal

:: Определяем директорию скрипта
set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..\..

:: Путь к конфигурационному файлу
set BOCHSRC=%SCRIPT_DIR%bochsrc.bxrc

:: Путь к образу диска
set DISK_IMG=%PROJECT_ROOT%\bin\disk.img

:: Проверяем существование образа диска
if not exist "%DISK_IMG%" (
    echo ERROR: Disk image not found at %DISK_IMG%
    exit /b 1
)

:: Проверяем существование конфигурационного файла
if not exist "%BOCHSRC%" (
    echo ERROR: Bochs config not found at %BOCHSRC%
    pause
    exit /b 1
)
cd %SCRIPT_DIR%
bochs.exe -q -f "%BOCHSRC%"