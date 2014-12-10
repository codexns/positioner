$ErrorActionPreference = "Stop"

$title = $args[0]
$desiredWidth = $args[1]
$desiredHeight = $args[2]

if ($title -eq $null -or $desiredWidth -eq $null -or $desiredHeight -eq $null) {
    echo 'Usage: .\windows.ps1 "Window Title" [width] [height]'
    exit
}

$handle = $null
$windowList = .\cmdow.exe /T /B /F
foreach ($win in $windowList) {
    $parts = $win.split(' ', 9)
    if ($parts[8] -match $title) {
        $handle = $parts[0]
        break
    }
}

$width = $null
$height = $null
get-wmiobject win32_videocontroller | foreach {
    $width = $_.CurrentHorizontalResolution
    $height = $_.CurrentVerticalResolution
}

$left = ($width - $desiredWidth) / 2
$top = ($height - $desiredHeight) / 2

.\cmdow.exe $handle /MOV $left $top /SIZ $desiredWidth $desiredHeight
