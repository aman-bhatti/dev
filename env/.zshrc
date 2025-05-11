export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

bindkey -s ^f "tmux-sessionizer\n"

alias vim='nvim'
alias ls='eza'

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

# zsh-autocomplete
