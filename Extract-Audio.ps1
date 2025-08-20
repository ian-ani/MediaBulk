<#
	Extract audio from video files with ffmpeg, example:
		.\Extract-Audio.ps1 C:\Music flac||pcm_s16le||libmp3lame
	Or:
		.\Extract-Audio.ps1 -Codec flac -Path C:\Music
#>

# === PARAMETERS ===

param (
	[Parameter(Position=0, Mandatory=$true)]
	[string]$Path,
	[Parameter(Position=1)]
	[string]$Codec
)

if ($args.Count -gt 0) {
	Write-Error "Example usage: .\Extract-Audio.ps1 C:\Music flac"
	exit 1
}

if (-not $Path) {
	Write-Error "Invalid path: $Path"
	exit 1
}

if (-not $Codec) {
	$Codec = "libmp3lame"
}

# === CONFIGURATION MESSAGES ===

Write-Output "`n=== Configuration === "
Write-Output "Path: $Path"
Write-Output "Codec: $Codec"
Write-Output "`nAudio will be extracted now...`n"

# === IMPORT UTILS FUNCTIONS ===

$Utils = . "$PSScriptRoot\utils\Utils.ps1"

# === HELPER FUNCTIONS ===

function Extract-Audio {
	param (
		[array]$FilesList
	)
	foreach ($File in $FilesList) {
		Write-Output "Audio to be extracted from: $File"
		$Output = Ask-FName -Name "song.mp3"

        try {
            ffmpeg -i "$File" -vn -acodec "$Codec" "$Output"

            if ($LASTEXITCODE -ne 0) {
                throw "FFMPEG failed to extract audio from $File"
            }

            Write-Host "Extraction from '$File' to '$Output' is complete." -ForegroundColor Green
        } catch {
            Write-Host "Can't extract audio from '$File'" -ForegroundColor Red
        }
	}
	Write-Output "All audio extracted from files."
}

# === MAIN ===

$OriginalPath = Get-CurrentPath
Change-Directory -Directory $Path
$Files = Get-File
Extract-Audio -FilesList $Files
Change-Directory -Directory $OriginalPath
