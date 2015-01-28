param(
	[Parameter(Mandatory=$true, Position=0, HelpMessage="Package Version")]
	[string]$version
)

$sourcePath=".\src\"
$destPath=".\output\"
$nuspecfile="Betclic.BuildTools.Node.nuspec"

if (Test-Path -path $destPath) {
    Write-Host "cleanup output folder" 
    Remove-Item $destPath -Recurse -Force
}

New-Item $destPath -Type Directory | Out-Null  

Write-Host "New version :"$version  -ForegroundColor Yellow
Copy-Item -Path $sourcePath"*" -Destination $destPath -Recurse 

Write-Host "updating package.json" 
(Get-Content $destPath"package.json").Replace("#version#", $version) | Set-Content $destPath"package.json"

Write-Host "Running npm install"
Start-process "npm" "update --save" -WorkingDirectory $destPath -NoNewWindow -PassThru -Wait | Out-Null   

Write-Host "Downloading latest node.exe version"
$webclient = New-Object System.Net.WebClient
$url = "http://nodejs.org/dist/latest/x64/node.exe"
$file = "$destPath\node.exe"
$webclient.DownloadFile($url,$file)

Write-Host "updating nuspec file" 
(Get-Content "$destPath\$nuspecfile").Replace("#version#", $version) | Set-Content "$destPath\$nuspecfile"

Write-Host "updating cmd files" 
(Get-Content $destPath"bin\node.cmd").Replace("#version#", $version) | Set-Content $destPath"bin\node.cmd"
(Get-Content $destPath"bin\npm.cmd").Replace("#version#", $version) | Set-Content $destPath"bin\npm.cmd"
(Get-Content $destPath"bin\git.cmd").Replace("#version#", $version) | Set-Content $destPath"bin\git.cmd"

Write-Host "generating nuget package"
$args = "Pack "+"$destPath\$nuspecfile"
Start-process ".nuget\nuget.exe" $args -NoNewWindow -PassThru -Wait | Out-Null

Write-Host "cleanup output folder" 
Remove-Item $destPath -Recurse -Force