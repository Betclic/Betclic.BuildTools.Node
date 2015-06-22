@echo off
SET PATH=%~dp0;%PATH%
SET npm_config_git=%~dp0git.cmd
"%~dp0node" "%~dp0..\..\packages\Betclic.BuildTools.Node.#version#\node_modules\rimraf\bin.js" %*