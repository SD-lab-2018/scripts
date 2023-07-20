@echo on

set COMFY_PATH=

set GIT=
set PYTHON=
set COMMANDLINE_ARGS=
set VENV=

if not defined GIT (set GIT=git)
if not defined PYTHON (set PYTHON=python)
if not defined COMFY_PATH (set "COMFY_PATH=ComfyUI\")
if not defined VENV (set "VENV=%COMFY_PATH%venv")


if exist %VENV% (goto :start_venv)
echo Creating venv in directory "%VENV%"
%PYTHON% -m venv %VENV%

:start_venv
set PYTHON="%VENV%\Scripts\Python.exe"
echo Python=%PYTHON%

%PYTHON% -s -m pip install --upgrade torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 xformers -r %COMFY_PATH%requirements.txt

:nodes
set ROOT=%~dp0%
cd %COMFY_PATH%custom_nodes

:: for using ControlNet
%GIT% clone https://github.com/Fannovel16/comfy_controlnet_preprocessors
cd comfy_controlnet_preprocessors
%PYTHON% install.py

cd %ROOT%