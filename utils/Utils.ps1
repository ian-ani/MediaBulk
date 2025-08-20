# === UTILS ===

function Get-CurrentPath {
	return Get-Location
}

function Change-Directory {
	param (
		[string]$Directory
	)

	if (-not(Test-Path $Directory)) {
		Write-Host "$Directory does not exist. Exiting program now..." -ForegroundColor Red
		exit 1
	}

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

function Ask-Settings {
	$Answer = Read-Host "Confirm configuration parameters? (Y/N)"

	if ($Answer.ToUpper() -eq "N") {
		exit 0
	}
}