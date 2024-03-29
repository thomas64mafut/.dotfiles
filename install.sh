# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source it
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.fish \
	nixpkgs.starship \
	nixpkgs.git \
	nixpkgs.lazygit \
	nixpkgs.git-credential-manager \
	nixpkgs.gh \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.direnv \
	nixpkgs.bat \
	nixpkgs.eza \
	nixpkgs.gcc \
	nixpkgs.nodejs \
	nixpkgs.nodePackages_latest.pnpm \
	nixpkgs.neofetch

# git config
stow git

# add fish to shells
command -v fish | sudo tee -a /etc/shells

# use fish as default shell
sudo chsh -s $(which fish) $USER

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

echo "RELOAD TERMINAL AND PASTE THE NEXT COMMANDS!!!!"
echo "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher 
fisher install jorgebucaran/nvm.fish
fisher install jorgebucaran/autopair.fish
fisher install lilyball/nix-env.fish
fisher install jethrokuan/fzf
fisher install jethrokuan/z
fisher install rstacruz/fish-npm-global"
