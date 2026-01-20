Function ConfirmDNSRecord {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [string]$RecordName
    )

    if (Resolve-DnsName -Name $RecordName -Type CNAME) {
        return $true
    } else {
        return $false
    }
}