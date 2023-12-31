# ~/.zshrc

# Completion
autoload -U compinit; compinit



branch_symbol=$'\uE0A0'

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '['$branch_symbol $branch']'
  fi
}

NEWLINE=$'\n'

# Enable substitution in the prompt.
#setopt prompt_subst
#prompt='%F{1}%n%f %F{3}%~%f%F{4} $(git_branch_name) %F{5} ${NEWLINE}>%f '

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.dotfiles/zsh/oh-my-posh/amro-edit.omp.json)"
fi

source ~/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

macchina
export PATH=$PATH:/Users/alexjanevik/.spicetify
