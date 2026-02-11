@echo off
REM SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
REM SPDX-License-Identifier: Apache-2.0

REM Quick build and launch script for aiconfigurator WebUI (Windows)

setlocal enabledelayedexpansion

echo ========================================
echo aiconfigurator WebUI Build ^& Launch
echo ========================================
echo.

REM Check Python version
echo 1. Checking Python version...
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python 3.9 or later from https://www.python.org/
    pause
    exit /b 1
)

for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
echo   Python version: %PYTHON_VERSION%
echo.

REM Check if Git LFS is installed
echo 2. Checking Git LFS...
git lfs version >nul 2>&1
if errorlevel 1 (
    echo   Warning: Git LFS is not installed.
    echo   Install it from: https://git-lfs.github.com/
    echo.
) else (
    echo   Git LFS is installed
    echo.
)

REM Pull LFS files
echo 3. Pulling Git LFS files...
git lfs pull
if errorlevel 1 (
    echo   Warning: Could not pull LFS files. Continuing anyway...
)
echo   LFS files pulled
echo.

REM Check if aiconfigurator is already installed
echo 4. Checking aiconfigurator installation...
python -c "import aiconfigurator" >nul 2>&1
if errorlevel 1 (
    echo   Installing aiconfigurator with webapp support...
    python -m pip install -e ".[webapp]"
    if errorlevel 1 (
        echo   Error: Installation failed
        pause
        exit /b 1
    )
    echo   Installation complete
    echo.
) else (
    for /f "tokens=*" %%i in ('python -c "import aiconfigurator; print(aiconfigurator.__version__)" 2^>nul') do set CURRENT_VERSION=%%i
    echo   aiconfigurator is already installed
    echo   Current version: !CURRENT_VERSION!
    echo.
)

REM Verify installation
echo 5. Verifying installation...
aiconfigurator version >nul 2>&1
if errorlevel 1 (
    echo   Error: Installation verification failed
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('aiconfigurator version 2^>^&1') do (
    echo   %%i installed successfully
    goto :verified
)
:verified
echo.

REM Check if Gradio is installed
echo 6. Checking Gradio...
python -c "import gradio" >nul 2>&1
if errorlevel 1 (
    echo   Error: Gradio is not installed. Try running: pip install -e ".[webapp]"
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('python -c "import gradio; print(gradio.__version__)" 2^>nul') do set GRADIO_VERSION=%%i
echo   Gradio !GRADIO_VERSION! is installed
echo.

echo ========================================
echo Build Complete! 🎉
echo ========================================
echo.
echo To launch the WebUI, run:
echo   aiconfigurator webapp
echo.
echo Or with custom options:
echo   aiconfigurator webapp --server-port 8080 --debug
echo.
echo The webapp will be available at:
echo   http://127.0.0.1:7860
echo.

REM Ask if user wants to launch now
set /p LAUNCH="Launch WebUI now? (y/n) "
if /i "%LAUNCH%"=="y" (
    echo.
    echo Launching WebUI...
    echo Access it at: http://127.0.0.1:7860
    echo Press Ctrl+C to stop the server
    echo.
    aiconfigurator webapp
)

endlocal
