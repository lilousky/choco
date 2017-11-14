$url_version = 'v1.55a-r7429'

$ErrorActionPreference = 'Stop'; 
$toolsDir  	 	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        	= 'https://szs.wiimm.de/download/szs-'+$url_version+'-cygwin.zip'
$packageName	= $env:ChocolateyPackageName
  
Get-ChocolateyWebFile $packageName "$($toolsDir)\tmp\szs-$($url_version)-cygwin.zip" $url 
Get-ChocolateyUnzip -FileFullPath "$($toolsDir)\tmp\szs-$($url_version)-cygwin.zip" -Destination "$($toolsDir)" -SpecificFolder "szs-$($url_version)-cygwin\bin\*" -PackageName 'wszst'

Move-Item "$($toolsDir)\szs-$($url_version)-cygwin\bin\*" "$($toolsDir)\"
Remove-Item -Recurse -Force "$($toolsDir)\szs-$($url_version)-cygwin\"
Remove-Item -Recurse -Force "$($toolsDir)\tmp\"

$null > "$($toolsDir)\windows-install.exe.ignore"
