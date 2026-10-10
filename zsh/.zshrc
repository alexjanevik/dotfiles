# tool paths
typeset -U path
path=("$HOME/.local/bin" "${ASDF_DATA_DIR:-$HOME/.asdf}/shims" $path "$HOME/.lsp/bin")
export VCPKG_ROOT="$HOME/vcpkg"

# shared history
HISTFILE="$HOME/.zhistory"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history share_history hist_expire_dups_first
setopt hist_ignore_dups hist_ignore_space hist_verify

# zsh tab completion, homebrew completions
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# search history
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# directory navigation and aliases
eval "$(zoxide init zsh)"
alias cd='z'
alias ls='eza --icons=always --grid'
alias lg='lazygit'

# fastfetch + starship
if (( $+commands[fastfetch] )); then
  fastfetch
  print
fi
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# keep newline between prompts but prevent extra newline when clearing the screen
# https://www.reddit.com/r/commandline/comments/13r2ou3/is_there_any_way_to_remove_the_first_newline_from/
PROMPT_NEEDS_NEWLINE=false
precmd() {
  if [[ "$PROMPT_NEEDS_NEWLINE" == true ]]; then
    echo
  fi
  PROMPT_NEEDS_NEWLINE=true
}
clear() {
  PROMPT_NEEDS_NEWLINE=false
  command clear
}

# zsh plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
