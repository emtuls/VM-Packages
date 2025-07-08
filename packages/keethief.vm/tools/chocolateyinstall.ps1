$ErrorActionPreference = 'Stop'
Import-Module vm.common -Force -DisableNameChecking

$toolName = 'KeeThief'
$category = VM-Get-Category($MyInvocation.MyCommand.Definition)

$zipUrl = 'https://github.com/GhostPack/KeeThief/archive/04f3fbc0ba87dbcd9011ad40a1382169dc5afd59.zip'
$zipSha256 = '2fe020645855564ce1d0236c3e83e8d66a09c91c00d95a40b88cbe9ffd5ca204'

# This tool does not have a `.exe` associated with it, so this links it to the directory
VM-Install-From-Zip $toolName $category $zipUrl $zipSha256 -withoutBinFile -innerFolder $true
