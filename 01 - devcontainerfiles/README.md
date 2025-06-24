# Setting Up a PowerShell Development Container in GitHub Codespaces


## Step-by-Step Guide


### 1. Creating a Devcontainer Configuration

1. Once your codespace is open, press `CTRL+SHIFT+P` to open the command palette
2. Type "Dev Containers: Add Dev Container Configuration Files..." and select it
3. Create a new devcontainer configuration
4. You'll see a list of container configuration templates
5. Type "PowerShell" in the search box to filter the list
6. Select "PowerShell" from the list of templates
7. You are prompted to select additional features to install. Ignore this prompt.
8. Click "OK"
9. Rebuild the container by pressing `CTRL+SHIFT+P` again, typing "Dev Containers: Rebuild Container", and selecting it

### 2. Improving the Devcontainer Configuration

1. Type ```$PSVersionTable``` in the terminal to verify that PowerShell is installed and working.
2. Note that the version is outdated
3. Change the image in the `devcontainer.json` file to use the latest version of PowerShell: ```image": "mcr.microsoft.com/powershell:latest```
4. Rebuild the image
5. Type ```$PSVersionTable``` again to verify that the PowerShell version has been updated
6. Note that the version is still outdated!
7. Change the image to ```mcr.microsoft.com/dotnet/sdk:9.0```
8. Rebuild the image
9. Type ```$PSVersionTable``` again to verify that the PowerShell version is now up-to-date
10. Accept that sometimes life doesn't make sense
11. Embrace the chaos (thank you Copilot)

### 3. Adding PowerShell Modules and Extensions
To enhance your PowerShell development experience, you can add PowerShell modules and VS Code extensions to your devcontainer configuration.

1. Open the `devcontainer.json` file in your `.devcontainer` directory
2.  Add a `postCreateCommand` to install PowerShell modules automatically when the container is built:

```"postCreateCommand": "pwsh -c \"Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; Install-Module -Name Pester -Scope AllUsers -Repository PSGallery; Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted\""```

3. Add VS Code extensions to the `devcontainer.json` file under the `customizations` section:

```json
			"extensions": [
				"ms-vscode.powershell",
				"github.copilot-chat"
			]
```
4. Rebuild the container.
5. Open a new terminal in your codespace and verify that the modules are installed by running:
   ```powershell
   Get-InstalledModule
   ```

6. YAY!

## If you got lost anywhere and want to continue the next section, run the following command in your terminal:

```powershell
 & './01 - devcontainerfiles/set-devcontainerfile.ps1'
 ```

