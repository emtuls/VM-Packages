$ErrorActionPreference = 'Stop'
Import-Module vm.common -Force -DisableNameChecking

try {
    # Install dependency: capa Python library
    VM-Pip-Install "flare-capa"

    # Install plugin
    $pluginName = "capa_explorer.py"
    $pluginUrl = "https://raw.githubusercontent.com/mandiant/capa/v8.0.0/capa/ida/plugin/capa_explorer.py"
    $pluginSha256 = "a9a60d9066c170c4e18366eb442f215009433bcfe277d3c6d0c4c9860824a7d3"
    VM-Install-IDA-Plugin -pluginName $pluginName -pluginUrl $pluginUrl -pluginSha256 $pluginSha256


    # Download capa rules
    $pluginsDir = VM-Get-IDA-Plugins-Dir
    $rulesUrl = "https://github.com/mandiant/capa-rules/archive/refs/tags/v8.0.0.zip"
    $rulesSha256 = "1ae71dfe99c9a0faee980e512de839d388a2f6717f7f5898966818790a449411"
    $packageArgs = @{
        packageName    = ${Env:ChocolateyPackageName}
        unzipLocation  = $pluginsDir
        url            = $rulesUrl
        checksum       = $rulesSha256
        checksumType   = 'sha256'
    }
    Install-ChocolateyZipPackage @packageArgs
    $rulesDir = Join-Path $pluginsDir "capa-rules-8.0.0" -Resolve

    # Set capa rules in the capa plugin
    $registryPath = 'HKCU:\SOFTWARE\IDAPython\IDA-Settings\capa'
    New-Item $registryPath -Force | Out-Null
    # ida_settings expects '/' in the rule path
    $value = $rulesDir.replace("\", "/")
    Set-ItemProperty $registryPath -Name "rule_path" -Value "`"$value`"" -Force | Out-Null
} catch {
  VM-Write-Log-Exception $_
}

