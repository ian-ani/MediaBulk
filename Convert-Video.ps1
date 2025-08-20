<#
	Converts video files with ffmpeg, example:
		.\Convert-Bulk.ps1 C:\Videos libx264
	Or:
		.\Convert-Bulk.ps1 -Codec libx264 -Path C:\Videos
#>

# === PARAMETERS ===

param (
	[Parameter(Position=0, Mandatory=$true)]
	[string]$Path,
	[Parameter(Position=1)]
	[string]$Codec
)

if (-not $Codec) {
	$Codec = "libx264"
}

# === IMPORT UTILS FUNCTIONS ===

$Utils = . "$PSScriptRoot\utils\Utils.ps1"

# === HELPER FUNCTIONS ===

function Convert-File {
	param (
		[array]$FilesList
	)
	foreach ($File in $FilesList) {
		Write-Output "File to be converted: $File"
		$Output = Ask-FName -Name "video.mp4"

		try {
			ffmpeg -i "$File" -c:v "$Codec" -c:a copy "$Output"

			if ($LASTEXITCODE -ne 0) {
				throw "FFMPEG failed to convert $File"
			}

			Write-Host "Conversion from '$File' to '$Output' is complete." -ForegroundColor Green
		} catch {
			Write-Host "Can't convert '$File'" -ForegroundColor Red
			Remove-Item $Output
		}
	}
	Write-Output "All files converted."
}

# === CONFIGURATION MESSAGES ===

Write-Output "`n=== Configuration === "
Write-Output "Path: $Path"
Write-Output "Codec: $Codec"
Ask-Settings
Write-Output "`nFiles will be converted now...`n"

# === MAIN ===

$OriginalPath = Get-CurrentPath
Change-Directory -Directory $Path
$Files = Get-File
Convert-File -FilesList $Files
Change-Directory -Directory $OriginalPath
