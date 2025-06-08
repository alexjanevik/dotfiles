#if [ "$TMUX" = "" ]; then tmux; fi
fastfetch
echo "\n"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:/Users/alexjanevik/.spicetify
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Eza (better ls) ----
alias ls="eza --icons=always --grid"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PATH=$PATH:/usr/local/opt/tcl-tk/bin

alias lg="lazygit"

. ~/.config/zsh/venv_wrapper # python virtualenv wrapper

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

[ -f "/Users/alexjanevik/.ghcup/env" ] && . "/Users/alexjanevik/.ghcup/env" # ghcup-env

export PATH=$PATH:$HOME/.lsp/bin
