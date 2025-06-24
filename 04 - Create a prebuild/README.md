# Creating and Managing GitHub Codespaces Prebuilds



### Step 1: Access Repository Settings

1. Navigate to your GitHub repository
2. Click on the "Settings" tab
3. In the left sidebar, click on "Codespaces"

### Step 3: Configure Prebuilds

1. Click on the "Prebuild configuration" tab
2. Click "Set up prebuild"
3. Configure the following settings:

   a. **branch**:
      Select the main branch
   
   b. **Prebuild triggers**:
      - On configuration change: Automatically creates a new prebuild when the devcontainer configuration changes
      - On push: Creates a prebuild on every push to the selected branches
      - Scheduled: Creates prebuilds on a regular schedule
    Choose on configuration change
   
   c. **Region availability**:
      - West europe
   

4. Click "Create" to set up the prebuild configuration

### Step 4: Monitor Prebuild Creation

1. After creating the configuration, GitHub will start creating the first prebuild
2. You can monitor the status of prebuild creation in the GitHub Actions of the repository
3. The initial prebuild might take several minutes to complete

### Step 5: Use Your Prebuilt Codespaces

Once prebuilds are available:
1. Click on the "Code" button in your repository
2. Select the "Codespaces" tab
3. Click "Create codespace on [branch]"
4. You should notice a significantly faster startup time with a message indicating the codespace was created from a prebuild


## Managing and Tracking Prebuild Billing

### Understanding Prebuild Billing

Prebuilds generate costs in two ways:
1. **Compute hours** for creating and updating prebuilds
2. **Storage costs** for storing prebuilds

### Step 1: Access Billing Settings

   - Go to [your personal settings](https://github.com/settings/billing/usage?period=3&group=2&query=product:codespaces)
   - Click ![alt text](image.png)
   - Select metered report and wait for the email
   - 
