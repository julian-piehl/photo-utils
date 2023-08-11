# Invoke-PS2EXE -inputFile ".\CR3 Mover.ps1" -outputFile ".\CR3 Mover.exe" -noConsole

# Key - HKEY_CLASSES_ROOT\Folder\shell\Move CR3 Files
# Key - HKEY_CLASSES_ROOT\Folder\shell\Move CR3 Files\command
# Default Value - D:\Bilder\CR3 Mover.exe "%1"

$path = $args[0]

if(!(Test-Path $path\CR3)) {
	New-Item -ItemType Directory -Path $path\CR3 | Out-Null
}

Get-Item $path\*.CR3 | Move-Item -Destination $path\CR3 | Out-Null

Write-Host Success $path
