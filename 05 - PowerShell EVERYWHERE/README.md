# PowerShell EVERYWHERE

## Setting Up Your Repository as a Dotfiles Repository for Codespaces

GitHub Codespaces allows you to automatically apply your personal settings and configurations to every codespace you create by setting up a dotfiles repository. This is especially useful for ensuring PowerShell is configured exactly the way you want it across all your development environments.

### What Are Dotfiles?

Dotfiles are configuration files that start with a dot (.) in Unix-like systems. They're used to customize your environment. Common examples include:
- `.bashrc` - Bash shell configuration
- `.gitconfig` - Git configuration
- `.vimrc` - Vim editor configuration
- `Microsoft.PowerShell_profile.ps1` - PowerShell profile (not a dotfile by name, but serves the same purpose)

### Setting Up Your Dotfiles Repository for Codespaces

1. If you do this at home, you should create a dedicated repository for your dotfiles. For this session, we will be using this current repository. The relevant files for dotfiles in this case are
    - `.config/powershell/Microsoft.PowerShell_profile.ps1`
    - `setup.sh` 
    Feel free to create a new repository with these files if you want to keep your dotfiles separate.

2. **Configure GitHub to use your dotfiles repository**:
   - Go to [GitHub Settings](https://github.com/settings/codespaces)
   - Under "Dotfiles", select this repository from the dropdown

3. **Test Your Configuration**:
   - Create a new empty repository on GitHub
   - Create a new codespace in the repository
   - Type `pwsh` in the terminal to start PowerShell
   - Type rob to see if your PowerShell profile is loaded correctly. 
