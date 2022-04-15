
$parentOU = 'OU=FILLIALE,DC=AYOUB,DC=local'

$IT       = 'OU=IT,OU=FILLIALE,DC=AYOUB,DC=local'
$SUPPORT = 'OU=SUPPORT,OU=FILLIALE,DC=AYOUB,DC=local'
Write-Host -ForegroundColor Green "Vérifions si les Unités d'organisation existe"
New-ADGroup -Name "portalcaptif" -GroupScope Global -Path "CN=Users,DC=AYOUB,DC=local"
                    # Vérifions si les Unités d'organisation existe si non créons les
         
if([ADSI]::Exists("LDAP://$parentOU")) {            
        Write-Host  -ForegroundColor GREEN "Filliale existe"            
                                            }
else {            
        Write-Host  -ForegroundColor CYAN "FILLIAL n'existe pas,Ne t'inquiète pas je m'occupe de les créer pour toi."   
        New-ADOrganizationalUnit -Name FILLIALE -Path "DC=AYOUB,DC=local"
            }     
 
   if([ADSI]::Exists("LDAP://$IT")) {            
        Write-Host  -ForegroundColor GREEN "IT exists "            
                                        }
else {            
        Write-Host  -ForegroundColor CYAN "IT n'existe pas,Ne t'inquiète pas je m'occupe de les créer pour toi."   
        New-ADOrganizationalUnit -Name IT -Path "OU=FILLIALE,DC=AYOUB,DC=local"
        } 
    if([ADSI]::Exists("LDAP://$SUPPORT")) {            
        Write-Host  -ForegroundColor GREEN "IT existe "            
                                            }
else {            
        Write-Host  -ForegroundColor CYAN "SUPPORT n'existe pas,Ne t'inquiète pas je m'occupe de les créer pour toi."   
        New-ADOrganizationalUnit -Name SUPPORT -Path "OU=FILLIALE,DC=AYOUB,DC=local"
           
        }           
#notif
New-BurntToastNotification -Text "Script 3 ", "execution du script 3 terminer" -AppLogo C:\Windows\SCRIPT_AYOUB_BELBACHIR\tmp.png
