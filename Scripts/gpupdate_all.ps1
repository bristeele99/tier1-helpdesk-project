# Requires: Run as Domain Admin in PowerShell (on a DC or with RSAT installed)
# === SECTION 1: Force gpupdate on All Computers ===
$Computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name

foreach ($comp in $Computers) {
    try {
        Invoke-Command -ComputerName $comp -ScriptBlock { gpupdate /force } -ErrorAction Stop
        Write-Host "✅ GPUpdate forced on $comp"
    }
    catch {
        Write-Host "❌ Could not update $comp ($($_.Exception.Message))"
    }
}
