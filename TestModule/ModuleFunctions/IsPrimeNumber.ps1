Function IsPrimeNumber {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [int]$Number
    )

    if (IsNegativeNumber -Number $Number) {
        Write-Warning -Message "Negative Number. Showing Result for Positive Number"
        $Number = $Number * -1
    }
    if ($Number -le 1) {
        return $false
    }
    if ($Number -le 3) {
        return $true
    }
    if (($Number % 2) -eq 0 -or ($Number % 3) -eq 0) {
        return $false
    }
    $i = 5
    while (($i * $i) -le $Number) {
        if ((($Number % 2) -eq 0) -or (($Number % ($i + 2))) -eq 0) {
            return $false
        }
        $i += 6
    }
    return $true
}
# Write-Host "31: $(IsPrimeNumber -Number 31)"
# Write-Host "32: $(IsPrimeNumber -Number 32)"
# Write-Host "13: $(IsPrimeNumber -Number 13)"