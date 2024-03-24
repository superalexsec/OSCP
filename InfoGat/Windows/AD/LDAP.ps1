# Store the domain object in the $DomainFull variable
$DomainFull = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

# Store the PdcRoleOwner name to the $PrimDC variable
$PrimDC = $DomainFull.PdcRoleOwner.Name

# Store the Distinguished Name variable into the $DinstName variable
$DistName = ([adsi]'').distinguishedName

====================
# Minimal Script
====================
# Get DomainObject:
$PrimDC = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().PdcRoleOwner.Name
# use COM adsi to get DistinguishedName and store on DistName var:
$DistName = ([adsi]'').distinguishedName
# Get full LDAP communication info:
$LDAPmine = "LDAP://$PDC/$DN"
# Get the root entry point to reserarch:
$direntrypoint = New-Object System.DirectoryServices.DirectoryEntry($LDAPmine)
# Create new object to research:
$dirsearch = New-Object System.DirectoryServices.DirectorySearcher($direntrypoint)
# Use FindAll to dump it all:
$dirsearch.FindAll()
