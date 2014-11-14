$Key_Path = Test-Path HKLM:\SOFTWARE\Deployment

IF ($Key_Path = "True"){
    Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\*" -Recurse -Force
    #New-Item -ItemType Directory -Path "C:\ProgramData\Microsoft\Windows\Start Menu"
    $Key = (Get-ItemProperty -Path HKLM:\Software\Deployment\ -Name MDTRoles).MDTRoles
    $Split_Key = $key -split ';'

    For($i =1; $i -le $Split_key.count; $i++){
    $Share_Path = "\\wildfire\distribution\Startmenu\" + $Split_Key[$i - 1] + "\*"
    Copy-Item -Path $Share_Path -Destination  "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" -Recurse
    }
    }
