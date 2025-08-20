# === UTILS ===

function Get-CurrentPath {
	return Get-Location
}

function Change-Directory {
	param (
		[string]$Directory
	)
	Set-Location $Directory
}

function Get-File {
	return Get-ChildItem | ForEach-Object { $_.Name }
}

function Ask-FName {
	param (
		[string]$Name
	)
	return Read-Host "Choose a name for your file (including extension, for example: $Name)"
}