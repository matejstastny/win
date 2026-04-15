<img src="./banner.jpg" alt="banner" width="100%">

<details>

>[!NOTE]
> This guide is for installing Windows on MacOS (specifically Windows 11 on UTM, but that should not matter)

# Installing image

The best way to get a Windows image on MacOS is through the [Crystal Fetch](https://github.com/TuringSoftware/CrystalFetch) app.

# Seting up a local account (to not have to sign in using a Microsoft account)

To go over Microsoft trying their hardest to make setting up Windows without a Microsoft account impossible, you have to first press `Shift + F10` to get to the terminal and than paste this command:

```
oobe\bypassnro
```

This will disable all internet connection to the machine, letting you skip the Microsoft account setup.

# Activating windows

To activate Windows in its full version use [Microsoft Activation Scripts (MAS)](https://massgrave.dev/). The command to install it is:

```powershell
irm https://get.activated.win | iex
```

# Debloating windows

On any new fresh install of Windows, run the [Talon](https://github.com/ravendevteam/talon) program. Without it Widnows is entirely unusable, extremely slow to even run as a MacOS virtual machine, filled with TONS of unnecssary software and straight up ads. To run this program you have to disable tons of Windows Defender things, because Edge is trying it's hardest to not let the user download and run this software. There is a lot of tutorials on this on the internet.

# Programs and assets

All programs and assets I use can be installed using this script (in this repo):

```powershell
irm https://raw.githubusercontent.com/matejstastny/win/refs/heads/main/install.ps1 | iex
```

This installs the following things:

- Sets the wallpaper from this repository
- _Git Bash_ for `bash` from [here](https://git-scm.com/install/windows)
- [TranslucentTB](https://apps.microsoft.com/detail/9pf4kz2vn4w9?hl=en-US&gl=US) for transparent menu bar

</details>

