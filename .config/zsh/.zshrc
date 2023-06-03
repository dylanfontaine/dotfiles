# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"
ZSH_CUSTOM="$ZDOTDIR"
ZSH_THEME=""

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

## Plugins
plugins=(git)
plugins+=(colored-man-pages)
plugins+=(k)
plugins+=(docker)
plugins+=(docker-compose)
plugins+=(alias-finder)
plugins+=(aws)
plugins+=(yarn)
plugins+=(zsh-completions)
plugins+=(zsh-interactive-cd)
plugins+=(zsh-autosuggestions)
plugins+=(zsh-syntax-highlighting)
plugins+=(z)
plugins+=(asdf)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_ALIAS_FINDER_AUTOMATIC=true

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
bindkey -v

## Lazy load custom functions
fpath=($ZDOTDIR/functions "${fpath[@]}")
autoload -Uz b

## Include config from includes dir
for f in ${ZDOTDIR}/includes/*(.) ; do
  . ${f}
done

# pnpm
export PNPM_HOME="/home/dylf/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end%

# fnm
[ -f ~/.local/bin/fnm ] && eval "`fnm env --use-on-cd`"

# rtx
[ -f ~/.local/share/rtx/bin/rtx ] && eval "$(~/.local/share/rtx/bin/rtx activate -s zsh)"

# Add completion to the path
fpath+="$ZDOTDIR/completion"

### zsh-completions
autoload -U compinit && compinit
###

eval "$(starship init zsh)"


