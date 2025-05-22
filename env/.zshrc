export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"

export HYPRSHOT_DIR="/$HOME/Pictures/screenshots/"

bindkey -s ^f "tmux-sessionizer\n"

alias vim='nvim'
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/aman/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

# plugins
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# fzf with bat and eza
# precmd() {
#   printf "\033k%s\033\\" "${PWD##*/}"
# }

fastfetch
