# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source it
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.fish \
	nixpkgs.starship \
	nixpkgs.git \
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
	nixpkgs.nodePackages_latest.pnpm

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

echo '\n\n'
echo 'RELOAD TERMINAL AND PASTE THE NEXT COMMANDS!!!!'
echo '\n\n'
echo 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher 
fisher update'