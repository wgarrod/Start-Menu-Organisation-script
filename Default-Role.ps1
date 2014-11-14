$Key_Path = Test-Path HKLM:\SOFTWARE\Deployment

$Key_Value = "Default"
# Change the value of this varible to the name of an MDT role.

IF ($Key_Path -eq "True")
    {$Deployment =(Get-ItemProperty -Path HKLM:\Software\Deployment\ -Name MDTRoles).MDTRoles
     $New_Value = $Deployment + ';' + $Key_Value
     Remove-ItemProperty -Path HKLM:\SOFTWARE\Deployment -Name MDTRoles 
     New-ItemProperty -Path HKLM:\SOFTWARE\Deployment -Name MDTRoles -PropertyType String -Value $New_Value}
    Else
    {New-Item -Path HKLM:\SOFTWARE\Deployment 
     New-ItemProperty -Path HKLM:\SOFTWARE\Deployment -Name MDTRoles -PropertyType String -Value $Key_Value}
