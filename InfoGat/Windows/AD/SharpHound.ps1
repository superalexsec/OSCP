

Import-Module .\Sharphound.ps1
Get-Help Invoke-BloodHound

# To see the examples, type: "get-help Invoke-BloodHound -examples".
# For more information, type: "get-help Invoke-BloodHound -detailed".
# For technical information, type: "get-help Invoke-BloodHound -full"

# Collect All:
# CollectionMethod gather All data, except for local group policies. Then save it @desktop (Json+zip):
Invoke-BloodHound -CollectionMethod All -OutputDirectory C:\Users\xpto\Desktop\ -OutputPrefix "corp audit"
