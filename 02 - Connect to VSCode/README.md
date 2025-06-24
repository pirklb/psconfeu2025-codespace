# Connecting to GitHub Codespaces in VS Code

This guide explains how to connect to a GitHub Codespace using your local VS Code installation.


### Step 1: Install the GitHub Codespaces Extension

1. Open VS Code
2. Click on the Extensions icon in the Activity Bar (or press `Ctrl+Shift+X`)
3. Search for "GitHub Codespaces"
4. Click "Install" on the GitHub Codespaces extension

### Step 2: Sign in to GitHub

1. In VS Code, click on the account icon in the bottom-left corner of the window
2. Select "Sign in to GitHub" from the menu
3. Follow the authentication prompts to sign into your GitHub account
4. Once authenticated, you'll see your GitHub username in the status bar

### Step 3: Access Your Codespaces


1. Click on the Remote Explorer icon in the Activity Bar (looks like a monitor)
2. From the dropdown at the top, select "GitHub Codespaces"
3. You'll see a list of available Codespaces. If you don't have any open, you can create one from here.
4. Click on the Codespace you want to connect to

### Step 4: Working with Your Codespace

Once connected:

- VS Code will reload and connect to your Codespace
- The bottom-left corner will show "Codespace: [name]"
- Your files and terminal will now operate within the Codespace environment

## Common Tasks

### Creating a New Codespace

1. Open the Command Palette (`Ctrl+Shift+P`)
2. Type and select "Codespaces: Create New Codespace"
3. Select the repository you want to create a Codespace for
4. Choose a branch, machine type, and region if prompted

### Stopping a Codespace

When you're done working:

1. Open the Command Palette (`Ctrl+Shift+P`)
2. Type and select "Codespaces: Stop Current Codespace"
3. Your Codespace will be stopped but the environment will be preserved

### Deleting a Codespace

1. Open the Command Palette (`Ctrl+Shift+P`)
2. Type and select "Codespaces: Delete Codespace"
3. Select the Codespace you want to delete
4. Confirm the deletion
