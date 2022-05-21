$url_version = 'v3.04a-r8427'
$os_bitness = Get-OSBitness

$ErrorActionPreference = 'Stop'; 
$toolsDir  	 	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        	= 'https://wit.wiimm.de/download/wit-'+$url_version+'-cygwin'+$os_bitness+'.zip'
$packageName	= $env:ChocolateyPackageName
  
Get-ChocolateyWebFile $packageName "$($toolsDir)\tmp\wit-$($url_version)-cygwin$($os_bitness).zip" $url 
Get-ChocolateyUnzip -FileFullPath "$($toolsDir)\tmp\wit-$($url_version)-cygwin$($os_bitness).zip" -Destination "$($toolsDir)" -SpecificFolder "wit-$($url_version)-cygwin$($os_bitness)\bin\*" -PackageName 'wit'

Move-Item "$($toolsDir)\wit-$($url_version)-cygwin$($os_bitness)\bin\*" "$($toolsDir)\"
Remove-Item -Recurse -Force "$($toolsDir)\wit-$($url_version)-cygwin$($os_bitness)\"
Remove-Item -Recurse -Force "$($toolsDir)\tmp\"

$null > "$($toolsDir)\windows-install.exe.ignore"
$null > "$($toolsDir)\windows-uninstall.exe.ignore"
