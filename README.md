## new install initial configs

```sh
mkdir ~/.local && cd ~/.local && mkdir bin share config \
&& git clone https://github.com/edsattar/.config.git ~/.local/config \
&& ln -sf ~/.local/config/.zshrc ~/.zshrc && ln -sf ~/.local/config/.p10k.zsh ~/.p10k.zsh
```

## Zsh OhMyZsh and Powerlevel10k

```sh
sudo apt update && sudo apt upgrade
sudo apt install zsh \
&& sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" \
&& git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
&& git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Git config

```sh
git config --global user.name "name"
git config --global user.email "email"
```

## Github CLI

```sh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt install gh -y
```

```
sudo apt install x11-xserver-utils x11-xkb-utils xcape
```

## nodejs

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts && nvm install node
```

## c compiler

```sh
sudo apt install build-essential gdb
```

## neovim

```sh
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz \
&& tar -xzf nvim-linux64.tar.gz -C ~/.local/share/ \
&& ln -sf ~/.local/bin/nivm ~/.local/share/nvim-linux64/bin/nvim
```
