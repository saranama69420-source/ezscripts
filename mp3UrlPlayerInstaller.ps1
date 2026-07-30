$installDir = "$env:USERPROFILE\bin"
New-Item -ItemType Directory -Force -Path $installDir | Out-Null

$url = "https://github.com/saranama69420-source/ezscripts/raw/refs/heads/main/play_mp3_url.exe"
$dest = Join-Path $installDir "play_mp3_url.exe"
Invoke-WebRequest -Uri $url -OutFile $dest

$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$installDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$installDir", "User")
}
