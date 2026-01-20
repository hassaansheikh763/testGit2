Function PrivilegedAccountLookup {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [string]$Username
    )

    try {
        $Username = $Username + "*-*"
        Get-ADUser -Filter {Name -like $Username} -Properties * | Sort-Object whencreated -Descending | Select-Object Name, whencreated
    }
    catch {
        Write-Host "No Accounts Found"
    }
}