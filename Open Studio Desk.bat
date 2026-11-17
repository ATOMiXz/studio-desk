@echo off
rem Double-click to open Studio Desk. The cat video needs http://, so opening index.html directly shows only the still image.
cd /d "%~dp0"
start "Studio Desk server" /min powershell -NoProfile -ExecutionPolicy Bypass -File ".claude\serve.ps1" -Root "."
timeout /t 2 /nobreak >nul
start "" http://localhost:8452/
