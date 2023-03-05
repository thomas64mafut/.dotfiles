set -gx EDITOR emacs
starship init fish | source
source ~/.config/fish/conf.d/abbr.fish
set fish_greeting ''
direnv hook fish | source

function storePathForWindowsTerminal --on-variable PWD
    if test -n "$WT_SESSION"
      printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
    end
end
