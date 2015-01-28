param($installPath, $toolsPath, $package, $project)

. (Join-Path $toolsPath 'bin_tools.ps1')

$cmd = '.bin\node.cmd'
Set-BuildAction $cmd 'None'
Update-BinPaths $cmd
Add-BinToPath $cmd

$cmd = '.bin\npm.cmd'
Set-BuildAction $cmd 'None'
Update-BinPaths $cmd
Add-BinToPath $cmd

$cmd = '.bin\git.cmd'
Set-BuildAction $cmd 'None'
Update-BinPaths $cmd
Add-BinToPath $cmd
