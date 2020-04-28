My Ubuntu Setup
===
My semi-automated setup of a basic Ubuntu desktop environment for development.

Initial Git Setup
---
1. Install the stock Git client (the setup scripts will later update it to a more recent version):
    ```bash
    sudo apt-get install -y git
    ```
1. Copy your private SSH key to `~/.ssh/id_rsa`.
1. Set the proper permissions for the private key file:
    ```bash
    chmod 600 ~/.ssh/id_rsa
    chown $USER:$USER ~/.ssh/id_rsa
    ```
1. Load the key in the SSH agent:
    ```bash
    ssh-add ~/.ssh/id_rsa
    ```
1. Configure your name and email for Git:
    ```bash
    git config --global user.name "<Your Name>"
    git config --global user.email "<your@email>"
    ```

Installing the Software
---
1. Create your workspace directory, e.g. `~/work`:
    ```bash
    mkdir ~/work && cd $_
    ```
1. Clone this GitHub repo.
    ```bash
    git clone https://github.com/jsiwrk/my-ubuntu.git
    ```
1. Enter the `setup` directory and run the installation script.
    ```bash
    cd my-ubuntu/setup
    ./setup.sh
    ```
1. Wait until the installation finishes. A message **All software installed successfully** will appear if no errors have occurred.

Configuring SmartGit
---
1. Open SmartGit (**Applications > SmartGit**).
1. In the setup wizard:
    - In **User Information**, verify your name and email.
    - In **SSH Client**, choose **Use system SSH client**.
    - In **Style**, choose **Commits (Log History)**.
1. Once the setup wizard ends, go to **Edit > Preferences**:
    - In **User Interface > Date Format**, choose `yyyy-MM-dd`.
    - In **User Interface > Time Format**, choose `HH-mm`.
    - In **Commands > Commit**, enable **Show line length guides**.
1. The first time you pull from a repository, a **Configure how to pull** window will appear, prompting you to choose between **rebase** and **merge**. Choose **rebase** and enable **Remember as default for other repositories**. (You can nonetheless change this behaviour at any moment by clicking **More options** in the **Pull** window.)

Installing IntelliJ IDEA
---
To install IntelliJ IDEA and keep it up-to-date, we will use the JetBrains Toolbox application (which has already been installed by the setup scripts).
1. Run the following command to open JetBrains Toolbox for the first time:
    ```bash
    /opt/jetbrains-toolbox/jetbrains-toolbox
    ```
1. In JetBrains Toolbox:
    - Choose to install **IntelliJ IDEA Community**. Wait until the installation finishes.
    - Press the gear icon next to **IntelliJ IDEA Community** and choose **Settings**.
    - Below, in **Shell scripts generation is disabled**, click **Enable**.
    - Enable the **Generate shell scripts** option.
    - In **Shell scripts location**, enter `/home/<user>/.local/share/bin`. Replace `<user>` by your Ubuntu username (note: Toolbox doesn't seem to support the use of `~` in this field).
    - Click **Quit** to exit Toolbox.
1. Open IntelliJ IDEA from the applications menu. You can also open it by typing `idea` in a terminal (or `idea <dir>`; avoid the use of `idea .` since it can cause problems with the Gradle integration).

Other Ubuntu Tweaks
---
1. In **Settings > Devices > Keyboard**:
    - Disable the **Save a screenshot to pictures** shortcut.
    - Assign the **Switch windows** command to the Alt+Tab shortcut (by default this shortcut is assigned to **Switch applications**).
2. Install Gnome Tweaks:
    ```bash
    sudo apt install gnome-tweaks
    ```
3. In **Tweaks**:
    - In **Top Bar**, enable **Clock > Date**.
    - Laptops only: enable **Top Bar > Battery Percentage**.
    - In **Startup Applications**: add the applications you want to be started automatically.

VMWare Tips
---
If you are running Ubuntu in a VMWare VM from a Windows host, the following tips can be useful.

**To access an Ubuntu directory from Windows using Samba:**
1. In Ubuntu, add the Samba user you will use to connect to the Samba share from Windows:
    ```bash
    sudo smbpasswd -U $USER -a
    ```
1. Choose a password when prompted. (Note: to change this password in the future, type `sudo smbpasswd -U $USER`.)
1. Expose the directory via Samba. Example: to expose the `~/work` directory as read-only:
    ```bash
    net usershare add work "~/work" "" $USER:R
    ```
1. In the Windows host, open a Windows Explorer. In **This PC** chose **Map network drive** in the context menu.
1. In **Drive**, choose a drive letter.
1. In **Folder**, specify `\\ubuntu\work` (or use the IP of your Ubuntu VM).
1. Keep the **Reconnect at sign-in** option enabled, and enable the option **Connect using different credentials**. Press **Finish**.
1. When Windows asks for credentials:
    - Enter your Ubuntu username preceded by a backslash (e.g. `\my.name`). (The backslash prevents Windows from connecting using your domain account, in case you are connected to a Windows domain.)
    - Use the password you previously entered in the `smbpasswd` command.
1. Now you should be able to view your `work` directory from Windows Explorer, in the chosen drive.

**To access a Windows folder from Ubuntu using VMWare Shared Folders:**
1. In VMWare Workstation, choose **Settings** in the VM context menu, go to **Options > Shared Folders** and add the folders you want to share with the VM.
1. In Ubuntu, edit `/etc/fstab`, and add these lines at the end of the file:
    ```
    # VMWare shared folders:
    .host:/    /mnt/hgfs/    fuse.vmhgfs-fuse    defaults,allow_other,uid=1000,gid=1000    0    0
    ```
1. Close your Ubuntu session and sign in again.
1. Create softlinks in your home directory for the shared folder(s). E.g.:
    ```bash
    ln -s /mnt/hgfs/Shared/ ~/Shared
    ```

**To enable automatic time sync with the Windows host:**
- In Ubuntu, type:
    ```bash
    vmware-toolbox-cmd timesync enable
    ```

**Other recommended Ubuntu settings when running in a VM:**
- In **Settings > Privacy > Screen Lock**, disable **Automatic Screen Lock**.
- In **Settings > Power > Power Saving > Blank screen**, choose **Never**.

**To make the Ubuntu VM start automatically in Windows:**
1. Press Windows+R and type `shell:startup`.
2. Create a shortcut in the opened folder.
3. As the shortcut target, specify something like:
    ```
    "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" -T ws start "C:\VMs\Ubuntu Desktop\Ubuntu Desktop.vmx"
    ```
4. As the name of the shortcut, specify e.g. **Start Ubuntu Desktop VM**.
