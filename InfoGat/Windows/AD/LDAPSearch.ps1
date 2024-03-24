function LDAPSearch {
    param (
        [string]$LDAPQuery
    )

    $PDC = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().PdcRoleOwner.Name
    $DistinguishedName = ([adsi]'').distinguishedName

    $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$PDC/$DistinguishedName")

    $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher($DirectoryEntry, $LDAPQuery)

    return $DirectorySearcher.FindAll()

}

# USAGE:
Import-Module .\LDAPSearch.ps1

# Get users from domain:
LDAPSearch -LDAPQuery "(samAccountType=805306368)"

# Get Groups from domain:
LDAPSearch -LDAPQuery "(objectclass=group)"

# enumerate every group available in the domain and also display the user members:
foreach ($group in $(LDAPSearch -LDAPQuery "(objectCategory=group)")) {
>> $group.properties | select {$_.cn}, {$_.member}
>> }

# Enumerate for specific groups:
$sales = LDAPSearch -LDAPQuery "(&(objectCategory=group)(cn=Sales))"
$sales.properties.member
