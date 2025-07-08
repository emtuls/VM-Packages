$ErrorActionPreference = 'Continue'
Import-Module vm.common -Force -DisableNameChecking

$toolName = "binaryninja"
$category = VM-Get-Category($MyInvocation.MyCommand.Definition)

VM-Uninstall-With-Uninstaller -toolName $toolName `
    -category $category `
    -fileType "EXE" `
    -silentArgs "/S /ALLUSERS=1"
