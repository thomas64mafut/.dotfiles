# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix 
. ~/.nix-profile/etc/profile.d/nix.sh

# install plugins
nix-env -iA \
	nixpkgs.fish \
	nixpkgs.git \
	nixpkgs.gh \
	nixpkgs.gcc \
	nixpkgs.unzip \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.direnv \
	nixpkgs.bat \
	nixpkgs.exa \
	nixpkgs.nodejs \

# stow
stow git

# "git auth login" for login in github

# install starship
curl -sS https://starship.rs/install.sh | sh

# source fish to current shells
echo $(which fish) | sudo tee -a /etc/shells

# change shell to fish
chsh -s $(which fish)

# install packer 
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
