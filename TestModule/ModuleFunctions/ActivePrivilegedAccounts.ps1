Function ActivePrivilegedAccounts {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [string]$Type
    )
    $Type = $Type.ToLower()
    $Filter = "*-" + $Type
    switch ($Type) {
        "wa" {
            Write-Host "Workstations Administrator Accounts"
            Write-Host $Filter
            Get-ADUser -Filter { Name -like $Filter } -Properties * | Sort-Object whencreated -Descending | Select-Object Name, whencreated
        }
        "sudo" { 
            Write-Host "Linux Administrator Accounts"
            Write-Host $Filter
            # Get-ADUser -Filter { Name -like $Filter } -Properties * | Sort-Object whencreated -Descending | Select-Object Name, whencreated
         }
        "admin" { 
            Write-Host "Server Administrator Accounts"
            Write-Host $Filter
            # Get-ADUser -Filter { Name -like $Filter } -Properties * | Sort-Object whencreated -Descending | Select-Object Name, whencreated
         }
        Default {
            Write-Host "Invalid Admin Account Type"
        }
    }
}