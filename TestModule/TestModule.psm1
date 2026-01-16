#Requires -Version 5.0
[cmdletbinding()]
param()

Write-Verbose "Operating from path: $PSScriptRoot"

Write-Verbose 'Dot Sourcing all .ps1 files in includable directories.'
foreach( $folder in @( 'ModuleFunctions') )
{
    $root = Join-Path -Path $PSScriptRoot -ChildPath $folder
    if( Test-Path -Path $root )
    {
        Write-Verbose "processing folder $root"
        $files = Get-ChildItem -Path $root -Filter *.ps1 -Recurse

        # dot source each file
        $files | where-Object{ $_.name -NotLike '*.Tests.ps1'} | 
            ForEach-Object{ Write-Verbose "$folder -> $($_.basename)"; . $_.FullName }
    }
}

Export-ModuleMember -function ( Get-ChildItem -Path "$PSScriptRoot\ModuleFunctions\*.ps1" ).basename