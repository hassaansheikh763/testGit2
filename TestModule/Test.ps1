# Import-Module -Name TestModule -Verbose

$number = Read-Host "Number"
if (IsPrimeNumber -Number $number) {
    Write-Host "Prime"
}
else {
    Write-Host "Not Prime"
}
# Write-Host "$number: $(IsPrimeNumber -Number 31)"

# Requires -Version 5.0
# [cmdletbinding()]
# param()

# Write-Host "Operating from path: $PSScriptRoot"

# Write-Host 'Dot Sourcing all .ps1 files in includable directories.'
# foreach( $folder in @( 'ModuleFunctions') )
# {
#     $root = Join-Path -Path $PSScriptRoot -ChildPath $folder
#     if( Test-Path -Path $root )
#     {
#         Write-Host "processing folder $root"
#         $files = Get-ChildItem -Path $root -Filter *.ps1 -Recurse

#         # dot source each file
#         $files | where-Object{ $_.name -NotLike '*.Tests.ps1'} | 
#             ForEach-Object{ Write-Host "$folder -> $($_.basename)"; . $_.FullName }
#     }
# }

# Export-ModuleMember -function ( Get-ChildItem -Path "$PSScriptRoot\public\*.ps1" ).basename