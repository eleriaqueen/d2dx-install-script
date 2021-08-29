# d2dx-install-script

Powershell script(s) to install and/or update d2dx by fetching latest release from https://github.com/bolrog/d2dx

## which script should I use ?

A - Use "custom path" script if you want to install d2dx to a specific D2 game folder or if you don't know whether your D2 Registry keys are in order

B - If you have only one D2 game folder and it was installed with official installer use "registry" script


## how to run just this once (more secure)

1 - Win + X (or Right-Click on Start Menu) -> Windows Powershell (Admin)

2 - In the powershell prompt type the following command then press Enter -> Set-ExecutionPolicy RemoteSigned -Scope Process

3 - Drag and drop the script you want to use onto the powershell window and press Enter

4 - Accept to run the script


## how to permanently allow executing powershell scripts (less secure)

1 - Win + X (or Right-Click on Start Menu) -> Windows Powershell (Admin)

2 - In the powershell prompt type the following command then press Enter -> Set-ExecutionPolicy RemoteSigned

3 - Accept the change of policy

4 - You can now right-click a psl script and "run with Powershell"
