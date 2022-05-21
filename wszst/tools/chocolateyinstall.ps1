$url_version = 'v2.27a-r8529'
$os_bitness = Get-OSBitness

$ErrorActionPreference = 'Stop'; 
$toolsDir  	 	= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        	= 'https://szs.wiimm.de/download/szs-'+$url_version+'-cygwin'+$os_bitness+'.zip'
$packageName	= $env:ChocolateyPackageName
  
Get-ChocolateyWebFile $packageName "$($toolsDir)\tmp\szs-$($url_version)-cygwin$($os_bitness)" $url 
Get-ChocolateyUnzip -FileFullPath "$($toolsDir)\tmp\szs-$($url_version)-cygwin$($os_bitness).zip" -Destination "$($toolsDir)" -SpecificFolder "szs-$($url_version)-cygwin$($os_bitness)\bin\*" -PackageName 'wszst'

Move-Item "$($toolsDir)\szs-$($url_version)-cygwin$($os_bitness)\bin\*" "$($toolsDir)\"
Remove-Item -Recurse -Force "$($toolsDir)\szs-$($url_version)-cygwin$($os_bitness)\"
Remove-Item -Recurse -Force "$($toolsDir)\tmp\"

$null > "$($toolsDir)\windows-install.exe.ignore"
$null > "$($toolsDir)\windows-uninstall.exe.ignore"
