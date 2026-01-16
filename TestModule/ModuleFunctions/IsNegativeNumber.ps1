Function IsNegativeNumber {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [int]$Number
    )
    if ($Number -lt 0) {
        return $true
    } else {
        return $false
    }
}