# PowerShell UAC Bypass Project

## Overview

This project demonstrates a PowerShell script to bypass User Account Control (UAC) and elevate privileges without prompting for an admin password. The script leverages a known UAC bypass technique using `fodhelper.exe`.

## Script Description

The script modifies specific registry keys to execute a desired command with elevated privileges when `fodhelper.exe` is triggered. It includes error handling to ensure that it provides meaningful feedback if it cannot run on a specific system.

## Features

- Bypasses UAC to spawn an elevated command prompt.
- Works on Windows 10 and later versions.
- Provides feedback when the script cannot run on unsupported systems.
- Includes error handling and registry cleanup.

## Requirements

- Windows 10 or later
- PowerShell
- Appropriate permissions to modify registry keys and run scripts

## Usage

1. **Clone the Repository**:
    ```sh
    git clone https://github.com/yourusername/UAC-Bypass-Project.git
    cd UAC-Bypass-Project
    ```

2. **Set Execution Policy**:
    Open PowerShell as an administrator and set the execution policy to allow running scripts:
    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```

3. **Run the Script**:
    Execute the script by running the following command in PowerShell:
    ```powershell
    .\Bypass.ps1
    ```
Testing Methodology

The script was tested on various systems to evaluate its effectiveness and resilience. The following configurations were tested:

    AWS - Windows 11 Latest
    VMWare - Windows 10 Home
    VMWare - Windows 8.1 Single Language Edition

Test Results
Windows 11 (AWS)

    Result: Success
    Notes: Required Windows Defender to be turned off.

Windows 10 Home (VMWare)

    Result: Mixed Success
    Notes: Opened settings tab showing "Add features" for non-admin users.

Windows 8.1 (VMWare)

    Result: Failure
    Notes: Script executed but did not spawn a command prompt.

Ethical Considerations

This project is intended for educational purposes and to demonstrate a known UAC bypass technique. Ensure you have permission to run such scripts on any system and adhere to all relevant legal and ethical guidelines.
Contributions

Contributions are welcome! Please open an issue or submit a pull request with your improvements.
