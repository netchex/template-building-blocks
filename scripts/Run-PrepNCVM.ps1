<#
.SYNOPSIS
Powershell script to sysprep a cloned system
.DESCRIPTION
.PARAMETER
.INPUTS
.OUTPUTS
.EXAMPLE
.LINK
#>

param(
  [Parameter]$NessusKey,
  [switch]$RunSysprep=$false
)
Remove-Computer -WorkgroupName "Workgroup" -Force

if($NessusKey -ne $null){
  Remove-itemproperty -path HKLM:\Software\Tenable -name TAG
  Start-Process -FilePath "$ENV:ProgramFiles\Tenable\Nessus Agent\nessuscli.exe" -ArgumentList "agent link --key=$NessusKey --host=cloud.tenable.com --port=443"
}

if($RunSysprep){
  Start-Process -FilePath "$env:windir\System32\Sysprep\Sysprep.exe" -ArgumentList '/generalize /quiet /shutdown'
}



