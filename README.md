# SD backup Windows

Create a gzipped sd backup from Windows

## Prerequisites

Ensure that you have enabled the powershell script execution policy to `RemoteSigned` or weaker, before running the script. You can do it with this command (as administrator):

```powershell
Set-ExecutionPolicy RemoteSigned
```

## Usage

Launch the script like this:

```powershell
.\backup_sd.ps1 [outputFile]
```
