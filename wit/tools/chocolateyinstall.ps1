$url_version = 'v3.01a-r7464'

$ErrorActionPreference = 'Stop'; 
$toolsDir  	 	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        	= 'https://wit.wiimm.de/download/wit-'+$url_version+'-cygwin.zip'
$packageName	= $env:ChocolateyPackageName
  
Get-ChocolateyWebFile $packageName "$($toolsDir)\tmp\wit-$($url_version)-cygwin.zip" $url 
Get-ChocolateyUnzip -FileFullPath "$($toolsDir)\tmp\wit-$($url_version)-cygwin.zip" -Destination "$($toolsDir)" -SpecificFolder "wit-$($url_version)-cygwin\bin\*" -PackageName 'wit'

Move-Item "$($toolsDir)\wit-$($url_version)-cygwin\bin\*" "$($toolsDir)\"
Remove-Item -Recurse -Force "$($toolsDir)\wit-$($url_version)-cygwin\"
Remove-Item -Recurse -Force "$($toolsDir)\tmp\"

$null > "$($toolsDir)\windows-install.exe.ignore"
$null > "$($toolsDir)\windows-uninstall.exe.ignore"
