# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=5
zstyle ':completion:*' prompt 'Possible corrections (%e errors)'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/neelo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory beep nomatch notify correct promptsubst
unsetopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

zstyle ':completion:*' rehash true

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.zsh_addons ]; then
    . ~/.zsh_addons
fi

if which ruby >/dev/null && which gem >/dev/null; then
    export PATH="$(gem env user_gemdir)/bin:$PATH"
fi

if [ -d $HOME/bin ]; then
	export PATH=$HOME/bin:$PATH
fi

if [ -f /usr/share/doc/pkgfile/command-not-found.zsh ]; then
	source /usr/share/doc/pkgfile/command-not-found.zsh
fi


PROMPT='[%F{red}%*%f] %F{green}%n%f@%F{green}%M%f:%F{yellow}%1~%f%F{red}$(git_super_status)%f$ '

function source_plugin {
  local plugin_name=$1
  shift 1
  local found=false
  for filepath in "$@"; do
    if [[ -f $filepath ]]; then
      source $filepath
      found=true
      break
    fi
  done
  if ! $found; then
    echo "$plugin_name not found; please install it."
  fi
}

# Load zsh plugins, supporting both Arch Linux and Homebrew on macOS

source_plugin zsh-syntax-highlighting \
  "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

source_plugin zsh-autosuggestions \
  "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

 # Not available in package managers
source_plugin zsh-git-prompt "$HOME/.local/share/zsh-git-prompt/zshrc.sh"
source_plugin history-search-multiword "$HOME/.local/share/history-search-multi-word/history-search-multi-word.plugin.zsh" 

setopt histignorespace
setopt HIST_IGNORE_ALL_DUPS

if [ -f ~/.pystartup ]; then
    export PYTHONSTARTUP=~/.pystartup
fi


export PAGER=vimpager
alias less=$PAGER
alias zless=$PAGER
