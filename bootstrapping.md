# Bootstrapping a workstation
## Software to install
- firefox (flatpak)
- figma font helper (also edit the config to point it to the local fonts
  directory)
- skype
- telegram
- keepassxc
- spotify
- discord
- texlive LuaLaTeX (+ python pygments)
- nodejs (from the official site)
- go (from the official site)
- dotnet (from the official site)
- vscode

## Fonts
- copy fonts from windows
- install the Gilroy font

## OneDrive
There is a great package `onedrive` in the Fedora repositories.
[GitHub](https://github.com/abraunegg/onedrive]).

Run as a service:
```
systemctl --user enable onedrive
```

## Config
run `make_symlinks.py` from the `dotfiles` directory to install all th
