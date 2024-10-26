function Ask-Path {
	while ($true){
		$askIfCurrentPath = Read-Host "This script needs to be in the same path as your files, is it in there? Y/n"
		if ($askIfCurrentPath -eq "Y" -or $askIfCurrentPath -eq "y") {
			break
		}
		elseif ($askIfCurrentPath -eq "N" -or $askIfCurrentPath -eq "n"){
			$askPathToChange = Read-Host "Enter the full path you want to change to"
			cd $askPathToChange
			Write-Output "Now you are in" (Get-Location).Path
		}
		else {
			Write-Output "Write Y or N."
		}
	}
}

function Ask-Conf {	
		$askIfConfIsCorrect = Read-Host "Is this configuration correct? `n [1]: Change path... `n [2]: It's OK! `n"
		switch ($askIfConfIsCorrect) {
			1 {Ask-Path}
			2 {Write-Output "Files are going to be converted now..."; break}
		}
}

function Get-File {
	$filesList = Get-ChildItem | ForEach-Object { $_.Name }
	return $filesList
}

function Ask-FName {
	$askFileName = Read-Host "Choose a name for your file (including extension, for example: video.mp4)"
	return $askFileName
}

function Convert-File {
	param (
		[array]$FilesList
	)
	foreach ($file in $FilesList) {
		if ($file -eq "Convert-Bulk.ps1") {
			continue
		}
		
		$output = Ask-FName	
		try {
			<# 
			CHANGE THIS NEXT LINE IF YOU WANT A DIFFERENT CONFIGURATION
			BUT KEEP "$file" AND "$output" AS IS
			#>
			ffmpeg -i "$file" -c:v libx264 -c:a copy "$output"
			Write-Output "Conversion from '$file' to '$output' is complete."
		}
		catch {"Can't convert '$file'"}
	}
	Write-Output "All files converted."
}

function Main {
	Ask-Path
	Ask-Conf
	$files = Get-File
	Convert-File -filesList $files
}

# ENTRY-POINT
Main