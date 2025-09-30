# ShowWebAddinsForAllMailboxesPowerShell.ps1

# Show web addins for all mailboxes

# Install Exchange Online Management module if not already installed
#Install-Module ExchangeOnlineManagement -Scope CurrentUser

# Connect to Exchange Online
Connect-ExchangeOnline

# Get all mailboxes
$mailboxes = Get-Mailbox -ResultSize Unlimited

foreach ($mailbox in $mailboxes) {
    Write-Host "Checking add-ins for: $($mailbox.PrimarySmtpAddress)"
    Get-App -Mailbox $mailbox.PrimarySmtpAddress | Format-Table DisplayName, Enabled, AppVersion, Scope, Type
}
