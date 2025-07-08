$ErrorActionPreference = 'Stop'
Import-Module vm.common -Force -DisableNameChecking

$toolName = 'EvilClippy'
$category = VM-Get-Category($MyInvocation.MyCommand.Definition)

$zipUrl = 'https://github.com/outflanknl/EvilClippy/archive/refs/tags/v1.3.zip'
$zipSha256 = '6ff1633de0ce8b99d5cf59a3e3cddf1960d4e7410d1441fd86940db42a7785a7'

# This tool does not have a `.exe` associated with it, so this links it to the directory
VM-Install-From-Zip $toolName $category $zipUrl $zipSha256 -withoutBinFile -innerFolder $true
