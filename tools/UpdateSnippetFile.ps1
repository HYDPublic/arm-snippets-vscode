   [CmdletBinding()]
    param (
       [Parameter(Mandatory=$true)]
        [string]$pathToFile,
        [Parameter(Mandatory=$true)]
        [string]$pathToPackageFile,
        [Parameter(Mandatory=$true)]
        [string]$buildNumber
    )

   "{" + (Get-Content $pathToFile -Raw) + "}"  | Set-Content $pathToFile

   Write-Output "Build Number:$buildNumber"

    

   (Get-Content $pathToPackageFile -Raw) -replace "extensionversionnumber", $buildNumber | Set-Content $pathToPackageFile

   Write-Output $(Get-Content $pathToPackageFile -Raw)