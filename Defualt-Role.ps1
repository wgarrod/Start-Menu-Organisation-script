$Key_Path = Test-Path HKLM:\SOFTWARE\Deployment

$Key_Value = "Defualt"
# Change the value of this varible to the name of an MDT role.

IF (Key_Path -eq "True")
    {$Deployment =(Get-IemProperty -Path HKLM:\Software\Deployment\ -Name MDTRoles).MDTRoles
     $New_Value = $Deployment = ";" = $Key_Value
     Remove-ItemProperty -Path HKLM:\SOFTWARE\Deployment -Name MDTRoles 
     New-ItemProperty -Path HKLM:\SOFTWARE|Deployment -Name MDTRoles -PropertyType String -Value $New_Value}
    
    {New-Item -Path HKLM:\Deployment 
     New-ItemProperty -Path HKLM:\SOFTWARE\Deployment -Name MDTRoles -PropertyType String -Value $New_Value}
