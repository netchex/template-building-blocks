<#
.SYNOPSIS
Powershell script to rename and joing a server to active directory 
.DESCRIPTION
.PARAMETER
.INPUTS
.OUTPUTS
.EXAMPLE
.LINK
#>

param(
    [Parameter]$VMName,
    [Parameter]$DomainName,
    [Parameter]$DomainCredential
  )

Rename-Computer -NewName $VMName
Add-Computer -Credential $DomainCredential -DomainName $DomainName