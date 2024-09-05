# New Ubuntu Setup
## Basic

```sh
sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update && sudo apt upgrade
sudo apt install wget curl wslu
```


## 1. Install Git
get auth token from my token repo

```sh
sudo apt install git
git config --global user.name "edsattar"
git config --global user.email "ahmed.sattar@live.com"
```

## 2. Github CLI
[source](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt)
```sh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

### GitHub Login
```sh
gh auth login
```

## 2. Zsh for Humans (Zsh, OhMyZsh, Powerlevel10k)
[source](https://github.com/romkatv/zsh4humans)

```sh
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi
```
### configs

```sh
mkdir ~/.local 
cd ~/.local 
mkdir bin share config
git clone https://github.com/edsattar/.config.git ~/.local/config
ln -sf ~/.local/config/.zshrc ~/.zshrc
ln -sf ~/.local/config/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.local/config/.tmux.conf ~/.tmux.conf
```
## 3. Neovim

```sh
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
```
```sh
tar -xzf nvim-linux64.tar.gz -C ~/.local/share/ && \
rm nvim-linux64.tar.gz && \
ln -sf ~/.local/share/nvim-linux64/bin/nvim ~/.local/bin/nvim && \
git clone https://github.com/edsattar/nvim-config.git ~/.config/nvim
```
### dependedcies
1. ripgrep, check for latest
```sh
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
```
2. fd,
```sh
curl -LO https://github.com/sharkdp/fd/releases/download/v10.0.0/fd_10.0.0_amd64.deb
sudo dpkg -i fd_10.0.0_amd64.deb
```
3. pyenv, Python version manager
```sh
curl https://pyenv.run | bash
```

## nodejs

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install node
npm install -g pnpm
```

## c compiler

```sh
sudo apt install build-essential gdb
```
## nerd font

```sh
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
```

## remap CAPSLOCK

download xremap

```sh
cd ~
curl -LO https://github.com/xremap/xremap/releases/download/v0.10.0/xremap-linux-x86_64-gnome.zip
unzip xremap-linux-x86_64-gnome.zip
rm xremap-linux-x86_64-gnome.zip
sudo mv xremap /usr/bin
```

create service to run xremap on startup

```sh
sudo cp ~/.local/config/xremap/xremap.service /usr/lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable xremap.service
sudo systemctl start xremap.service
```
