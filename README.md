# WiFi-Password

People ask you for the Wi-Fi password. Answer quickly. **Windows only**.

![Screenshot](https://cloud.githubusercontent.com/assets/557590/6204307/05ab9f88-b54f-11e4-9293-b2bd8c20a409.png)

This is inspired by [same-purpose tool for OSX](https://github.com/rauchg/wifi-password) by [@rauchg](https://github.com/rauchg).

## How to use

**1. Install it**

First of all, install [PsGet](http://psget.net/) if you don't have it yet - it's awesome module manager for PowerShell:

```powershell
(New-Object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
```

Now, you can easily install module itself:

```powershell
Install-Module WiFi-Password
```

**2. Use it:**

To get the password for the WiFi you're currently logged onto:

```powershell
Show-WiFiPassword
```

or just

```powershell
wifi-password
```

To get it for a specific SSID:

```powershell
$ wifi-password <ssid>
```

To list all the stored WiFi networks:

```powershell
Select-WiFi
```

## License

MIT
