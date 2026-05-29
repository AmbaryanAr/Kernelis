@echo off
setlocal

set SCRIPT_DIR=%~dp0
set BIN_DIR=%SCRIPT_DIR%..\..\bin
set DISK_IMG=%BIN_DIR%\disk.img

if not exist "%BIN_DIR%" mkdir "%BIN_DIR%"

simplevde.exe --disk-create -file="%DISK_IMG%" -table=mbr -size=256M
simplevde.exe --part-create -file="%DISK_IMG%" -part=1 -type=fat32
simplevde.exe --format -file="%DISK_IMG%" -part=1 -fs=fat32
simplevde.exe --fs-reserve-init -file="%DISK_IMG%" -part=1

@REM установка активного раздела
@REM simplevde.exe --part-set-active -file="%DISK_IMG%" -part=1