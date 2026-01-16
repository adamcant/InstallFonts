$FontSource = Join-Path (Split-Path $MyInvocation.MyCommand.Definition -Parent) 'fonts'
$Shell      = New-Object -ComObject Shell.Application
$FontsFolder= $Shell.Namespace(0x14)

Get-ChildItem -Path $FontSource -Include *.ttf,*.otf -Recurse | ForEach-Object {
    Write-Host "Installing font: $($_.Name)"
    $FontsFolder.CopyHere($_.FullName)
}

Write-Host "Done!"