Function AddDNSRecord {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [string]$Type,
        [Parameter( Mandatory )]
        [string]$RecordName,
        [Parameter( Mandatory )]
        [string]$TargetHost
    )
    $ZoneName = "spacex.corp"
    $DomainController = "htvwp1adds002"
    if (!(ConfirmDNSRecord -RecordName $RecordName)) {
        # Add-DnsServerResourceRecordCName -Name $RecordName -HostNameAlias $TargetHost -ZoneName $ZoneName -ComputerName $DomainController
        Write-Host "Record Needs to be Added"
    } else {
        Write-Host "Record Already Exists"
        Get-DnsServerResourceRecord -ZoneName $ZoneName -ComputerName $DomainController -Name $RecordName
    }
}