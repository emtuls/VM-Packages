$ErrorActionPreference = 'Stop'
Import-Module vm.common -Force -DisableNameChecking

$toolName = 'SpoolSample'
$category = VM-Get-Category($MyInvocation.MyCommand.Definition)

$zipUrl = 'https://github.com/leechristensen/SpoolSample/archive/688971e69cbe9240ea84bdd38f732dd9817110f8.zip'
$zipSha256 = '1e5f54b9317ac053fe51e373b3e3b830573e2d14612bf4a038750a6c6284fb3d'

# This tool does not have a `.exe` associated with it, so this links it to the directory
VM-Install-From-Zip $toolName $category $zipUrl $zipSha256 -withoutBinFile -innerFolder $true
