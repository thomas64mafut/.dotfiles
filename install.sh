# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source it
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
  nixpkgs.zsh \
  nixpkgs.starship \
  nixpkgs.git \
  nixpkgs.git-credential-manager \
  nixpkgs.gh \
  nixpkgs.lazygit \
  nixpkgs.neovim \
  nixpkgs.tmux \
  nixpkgs.stow \
  nixpkgs.fzf \
  nixpkgs.zoxide \
  nixpkgs.ripgrep \
  nixpkgs.direnv \
  nixpkgs.bat \
  nixpkgs.eza \
  nixpkgs.gcc \
  nixpkgs.nodejs \
  nixpkgs.nodePackages_latest.pnpm \
  nixpkgs.neofetch \
  nixpkgs.docker

# add zsh to shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as main shell
sudo chsh -s $(which zsh) $USER
sudo timedatectl set-timezone America/Argentina/Tucuman

# stow
stow git
stow zsh
stow tmux

# login into github
gh auth login

# setup github user in git
gh auth setup-git

# prompt the user for their name and email
read -p "Enter your name: " name
read -p "Enter your email: " email

# set the name and email in the global .gitconfig file
git config --global user.name "$name"
git config --global user.email "$email"

git config --global init.defaultBranch main

# setup ssh-agent systemd user service
if systemctl --user is-active ssh-agent.service >/dev/null 2>&1; then
  echo "ssh-agent service is already active."
else
  echo "enabling and starting ssh-agent service..."
  systemctl --user enable ssh-agent.service
  systemctl --user start ssh-agent.service
fi
