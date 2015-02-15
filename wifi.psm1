function Extract-Value(
    [string[]]$Lines,
    [string]$Name
) {
    $Lines | Select-String " $Name\s+: (.*)" |% { $_.Matches.Groups[1].Value }
}

<#
.Synopsis
    Get list of Wi-Fi networks.
.Description
    Returns SSIDs of all the stored Wi-Fi networks.
.Example
    List-WiFi
#>
function Select-WiFi {
    netsh wlan show profiles | Select-String ": (.*)" |% { $_.Matches.Groups[1].Value }
}

<#
.Synopsis
    View password of current or given Wi-Fi network.
.Description
    Allows to view stored password of currently or earlier connected Wi-Fi network.
.Parameter SSID
    Name of stored Wi-Fi network.
.Example
    # View password of currently connected Wi-Fi network.
    Show-WiFiPassword
.Example
    # View stored password of earlier connected Wi-Fi network.
    Show-WiFiPassword Home
#>
function Show-WiFiPassword(
    [string]$SSID = (Extract-Value (netsh wlan show interface) "SSID")
) {
    $Network = netsh wlan show profiles name=$SSID key=clear
    If (!$?) {
        Write-Host $Network
        Return
    }
    $AuthType = Extract-Value $Network "Authentication"
    $Password = Extract-Value $Network "Key Content"
    Write-Host "
SSID       : $SSID
Password   : $Password
Auth type  : $AuthType
"
}

Set-Alias WiFi-Password Show-WiFiPassword

Export-ModuleMember -Function *WiFi* -Alias *WiFi*
