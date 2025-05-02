# Requires: Run as Domain Admin in PowerShell (on a DC or with RSAT installed)

# === SECTION 1: Create New AD Users ===
# List of users with their assigned OUs
$Users = @(
    @{Name="John Doe"; Username="jdoe"; Password="Winter2025!"; OU="HR"}
    @{Name="Sarah Lee"; Username="slee"; Password="Spring2025!"; OU="IT"}
    @{Name="Mike Chan"; Username="mchan"; Password="Fall2025!"; OU="Support"}
)

foreach ($user in $Users) {
    $securePass = ConvertTo-SecureString $user.Password -AsPlainText -Force
    $upn = $user.Username + "@helpdesk.local"
    $ouPath = "OU=$($user.OU),DC=helpdesk,DC=local"

    New-ADUser -Name $user.Name `
               -SamAccountName $user.Username `
               -UserPrincipalName $upn `
               -AccountPassword $securePass `
               -Enabled $true `
               -PasswordNeverExpires $false `
               -Path $ouPath `
               -ChangePasswordAtLogon $true

    Write-Host "✅ Created user $($user.Username) in OU: $($user.OU)"
}
