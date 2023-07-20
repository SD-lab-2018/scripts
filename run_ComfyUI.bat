@echo off

set COMFY_PATH=

set COMMANDLINE_ARGS=
set VENV=

if not defined COMFY_PATH (set "COMFY_PATH=ComfyUI\")
if not defined VENV (set "VENV=%COMFY_PATH%venv")

set PYTHON="%VENV%\Scripts\Python.exe"

%PYTHON% -s %COMFY_PATH%main.py --windows-standalone-build --enable-cors-header %COMMANDLINE_ARGS%

