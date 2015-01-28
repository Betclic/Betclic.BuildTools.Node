param($installPath, $toolsPath, $package, $project)

. (Join-Path $toolsPath 'bin_tools.ps1')

$cmd = '.bin\node.cmd'
Delete-Bin $cmd

$cmd = '.bin\npm.cmd'
Delete-Bin $cmd

$cmd = '.bin\git.cmd'
Delete-Bin $cmd
