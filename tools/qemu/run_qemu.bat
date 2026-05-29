@echo off
setlocal

set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..\..
set DISK_IMG=%PROJECT_ROOT%\bin\disk.img

:: Проверяем существование образа диска
if not exist "%DISK_IMG%" (
    echo ERROR: Disk image not found at %DISK_IMG%
    exit /b 1
)

qemu-system-x86_64.exe -hda "%DISK_IMG%" -m 512M -no-reboot -no-shutdown