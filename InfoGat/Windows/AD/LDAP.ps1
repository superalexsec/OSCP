# Store the domain object in the $DomainFull variable
$DomainFull = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

# Store the PdcRoleOwner name to the $PrimDC variable
$PrimDC = $DomainFull.PdcRoleOwner.Name

# Store the Distinguished Name variable into the $DinstName variable
$DistName = ([adsi]'').distinguishedName
