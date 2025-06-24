#!/bin/sh


if [ -z "$USER" ]; then
 USER=$(id -un)
fi

mv /workspaces/.codespaces/.persistedshare/dotfiles $HOME/dotfiles

cd $HOME

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

###################################
# Install PowerShell (optimized for speed)

# Check if PowerShell is already installed
if command -v pwsh >/dev/null 2>&1; then
    echo "PowerShell is already installed, skipping installation."
else
    echo "Installing PowerShell..."
    
    # Try fast binary installation first
    # Use a stable version that's known to work well
    PWSH_VERSION="7.5.*"
    PWSH_URL="https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
    PWSH_DIR="/opt/microsoft/powershell/7"
    
    # Create PowerShell directory
    sudo mkdir -p "$PWSH_DIR"
    
    # Download and extract PowerShell binary (with timeout for reliability)
    if wget -q --timeout=30 --tries=2 "$PWSH_URL" -O /tmp/powershell.tar.gz; then
        echo "Downloaded PowerShell binary, extracting..."
        sudo tar zxf /tmp/powershell.tar.gz -C "$PWSH_DIR"
        sudo chmod +x "$PWSH_DIR/pwsh"
        
        # Create symlink if it doesn't exist
        if [ ! -L /usr/bin/pwsh ]; then
            sudo ln -sf "$PWSH_DIR/pwsh" /usr/bin/pwsh
        fi
        
        rm /tmp/powershell.tar.gz
        echo "PowerShell installed successfully via direct download."
    else
        echo "Direct download failed, falling back to apt installation..."
        
        # Get the version of Ubuntu
        source /etc/os-release
        
        # Download the Microsoft repository keys
        wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
        
        # Register the Microsoft repository keys
        sudo dpkg -i packages-microsoft-prod.deb
        
        # Delete the Microsoft repository keys file
        rm packages-microsoft-prod.deb
        
        # Update the list of packages after we added packages.microsoft.com
        sudo apt-get update
        
        # Install PowerShell
        sudo apt-get install -y powershell
    fi
fi

# Target location for PowerShell profile
PROFILE_DIR="$HOME/.config/powershell"
PROFILE_FILE="Microsoft.PowerShell_profile.ps1"

# Path to your custom profile (within the dotfiles repo)
SOURCE_PROFILE="$HOME/dotfiles/.config/powershell/$PROFILE_FILE"

# Ensure the target directory exists
mkdir -p "$PROFILE_DIR"

# Symlink the profile (or use cp if you prefer copying)
ln -sf "$SOURCE_PROFILE" "$PROFILE_DIR/$PROFILE_FILE"

echo "[dotfiles] PowerShell profile set up at $PROFILE_DIR/$PROFILE_FILE"
# Change shell to pwsh
sudo chsh "$(id -un)" --shell "/usr/bin/pwsh"

# done