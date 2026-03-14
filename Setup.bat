@echo off
title Installation Furry Tools
color 0A

echo ========================================
echo    INSTALLATION DE FURRY TOOLS
echo ========================================
echo.

echo [1/4] Verification de Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERREUR] Python n'est pas installe !
    echo.
    echo Veuillez installer Python 3.10 depuis :
    echo https://www.python.org/downloads/
    echo.
    echo IMPORTANT: Cochez "Add Python to PATH" lors de l'installation
    pause
    exit /b 1
)

for /f "tokens=2" %%i in ('python --version 2^>^&1') do set pyver=%%i
echo Python %pyver% trouve - OK
echo.

echo [2/4] Installation des dependances...
pip install --upgrade pip >nul 2>&1
pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo [ERREUR] Echec de l'installation des dependances
    pause
    exit /b 1
)
echo Dependances installees - OK
echo.

echo [3/4] Verification des fichiers...
if not exist "furry_tools.py" (
    echo [ERREUR] furry_tools.py manquant !
    pause
    exit /b 1
)
echo Fichiers presents - OK
echo.

echo [4/4] Lancement de Furry Tools...
echo.
echo ========================================
echo    INSTALLATION TERMINEE !
echo ========================================
echo.

start pythonw furry_tools.py
timeout /t 3 /nobreak >nul
exit
