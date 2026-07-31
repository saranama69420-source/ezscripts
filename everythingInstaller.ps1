$installDir = "$env:USERPROFILE\bin"
New-Item -ItemType Directory -Force -Path $installDir | Out-Null

$urls = @(
    "https://github.com/saranama69420-source/ezscripts/raw/refs/heads/main/play_mp3_url.exe" // mp3 url player
)

for ($i = 0; $i -lt $urls.Count; $i++) {
    $url = $urls[$i]
    $dest = Join-Path $installDir ([System.IO.Path]::GetFileName($url))

    Invoke-WebRequest -Uri $url -OutFile $dest
}


$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$installDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$installDir", "User")
}
