### D2DX Update Wrapper ###
### Custom Path ver. ###

# Modify this variable with the path to Diablo II
$d2path = 'd:\Games\Diablo II - Testbench\'

# Additional variables we need to declare
$d2dxadd = $d2path+'\d2dx-addendum'
$d2dxdll = $d2dxadd+'\glide3x.dll'

# Source file location
$source = 'https://github.com/bolrog/d2dx/releases/latest/download/d2dx.zip'

# Destination to save the file
$zipdestination = $env:TEMP+'\d2dx.zip'

# #Download the latest d2dx release
Invoke-WebRequest -Uri $source -OutFile $zipdestination

# Extract zip to custom directory inside Diablo Folder
Expand-Archive -LiteralPath $zipdestination -DestinationPath $d2dxadd -force

if (Test-Path ($d2path+'glide3x.dll') -PathType leaf)
{
    Write-Output("Found existing `'glide3x.dll`' in Diablo II folder")
    Write-Output("`nCalculating file hashes :")

    $oldfilehash = (Get-FileHash -Path ($d2path+'glide3x.dll')).Hash
    $newfilehash = ((Get-FileHash -Path $d2dxdll)).Hash

    Write-Output("`n`tExisting `t->`t" + $oldfilehash)
    Write-Output("`n`tNew `t`t->`t" + $newfilehash)

    Write-Output("`n`nComparing file hashes...")

    if ($oldfilehash -eq $newfilehash)
    {
        Write-Output("`nYou already have the latest dll !")
        Remove-Item -LiteralPath $d2dxdll -Force
    }
    else 
    {
        Write-Output("`nOverwriting old dll with new one...")
        Move-Item -Force -Path $d2dxdll -Destination $d2path
    }

}
else
{
    Write-Output("`nMoving dll into Diablo II folder...")
    Move-Item -Force -Path $d2dxdll -Destination $d2path
}
Write-Output("`n`nAll done !`n`n`nYou will find Readme, OpenSource licenses and an optional config file in 'd2dx-addendum' inside the game folder")
Read-Host -Prompt "`n`nPress Enter to exit"