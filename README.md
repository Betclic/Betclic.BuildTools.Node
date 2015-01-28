# Betclic.BuildTools.Node
Portable & standalone build tools (node+npm+git) for Front end dev and MsBuild integration. 

Motivations
---------------
TODO

How to use ?
--------------

You have to install the nuget package first via

`
PM > Install-Package  Betclic.BuildTools.Node
`

Add a new [MyCustomPackageTesterMyProjectName].wpp.targets file into your Visual project. This file allow you to run MsBuild tasks, especially node&npm commands for your front end build process (gulp, grunt, bower, ...).

A very simple *.wpp.targets could be

```
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" >
<Target Name="NpmInstall" AfterTargets="PrepareForBuild">
    <Exec Command=".bin\npm --version" Timeout="30000"  />
    <Exec Command=".bin\npm install" Timeout="30000" />
  </Target>
</Project>
```

The npm version will be displayed during the build process and all node modules will be installed.


How to Build ?
--------------

`
PS > .\pack.ps1 -version [VERSION]
`
