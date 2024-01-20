set -gx EDITOR code --wait 
source ~/.config/fish/conf.d/abbr.fish
set fish_greeting ''
direnv hook fish | source
starship init fish | source

function storePathForWindowsTerminal --on-variable PWD
    if test -n "$WT_SESSION"
        printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
    end
end

# pnpm
set -gx PNPM_HOME "/home/six/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
