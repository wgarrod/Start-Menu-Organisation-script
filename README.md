# Start-Menu-Organisation-script
A collection of powershell scripts designed to organise the Windows 7 Start Menu 

Scripts were desgined to work along side MDT.

Intened use is to have a diffent version of the Default-role.ps1 script for each Role in MDT 
and then have the script assigned to that Role as an Application so that it will be run on deployment.
The second script (Create-Startmenu.ps1) should be run on each computer at boot to automaticly organise 
the start menu.

Default-role.ps1 Creates or add values to a registry key that is used by Create-Startmenu.ps1 to orginse
the start menu. You will need to create a new copy of Default-role.ps1 for each MDT role and change the 
Key-value on line 3 to the name of the MDT Role

These scripts will require a network share to hold all of the link files and directories that you wish to be
used in the startmenu. It will need to be structured so that you have a directory for each role, the names
of these directories will need to be an exact match to the names of the values that you are adding to the
registrey. In each of these directories you will have the link files for each of the application install 
by the MDT role. You will need to configure this network share in Create-Startmenu.ps1 on line 10.

