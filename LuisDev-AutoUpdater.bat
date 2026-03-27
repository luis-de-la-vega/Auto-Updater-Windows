@echo off
title LuisDev AutoUpdater
chcp 65001 >nul

:: ANSI colors
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

cls

echo.
echo %ESC%[36m==========================================%ESC%[0m
echo %ESC%[35m       LuisDev AutoUpdater v1.0%ESC%[0m
echo %ESC%[36m==========================================%ESC%[0m
echo %ESC%[90m   Aggiornamento automatico via Winget%ESC%[0m
echo.

echo %ESC%[33m[*]%ESC%[0m Analisi sistema...
timeout /t 1 >nul

:: Controllo Winget
where winget >nul 2>&1
if errorlevel 1 (
    echo.
    echo %ESC%[31m[ERRORE]%ESC%[0m Winget non trovato
    timeout /t 2 >nul
    exit /b
)

echo %ESC%[32m[OK]%ESC%[0m Winget rilevato
echo %ESC%[33m[*]%ESC%[0m Ricerca aggiornamenti...
timeout /t 1 >nul

echo.
echo %ESC%[36m[>>]%ESC%[0m Avvio aggiornamento automatico...
echo.

:: Aggiornamento (senza log)
winget upgrade --all --accept-source-agreements --accept-package-agreements --silent

echo.
echo %ESC%[32m[OK]%ESC%[0m Aggiornamento completato
echo.

echo.
echo %ESC%[36m==========================================%ESC%[0m
echo %ESC%[35mLuisDev Systems (C) 2026%ESC%[0m
echo %ESC%[36m==========================================%ESC%[0m
echo.
timeout /t 2 >nul
exit
