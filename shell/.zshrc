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
alias la='ls -AA'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.zsh_addons ]; then
    . ~/.zsh_addons
fi

if command -v rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
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


PROMPT='[%F{red}%*%f] %F{green}%n%f@%F{green}%M%f:%F{yellow}%1~%f%F{red}${vcs_info_msg_0_}%f$ '

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

if [[ -d "$HOME/.local/share/zsh-jj/functions" ]]; then
    fpath+="$HOME/.local/share/zsh-jj/functions"

    autoload -Uz vcs_info
    autoload -U colors && colors

    zstyle ':vcs_info:*' enable jj git

    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst

    zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
    +vi-git-untracked(){
        if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            git status --porcelain | grep '??' &> /dev/null ; then
            hook_com[staged]+='!' # signify new files with a bang
        fi
    }

    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*:*' formats " %{$fg[blue]%}(%s %{$fg[red]%}%m%u%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"
fi


if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi


if command -v fzf &> /dev/null; then
  source_plugin fzf "/usr/share/fzf/key-bindings.zsh" "$HOME/.fzf.zsh"
  source_plugin fzf "/usr/share/fzf/completion.zsh" "$HOME/.fzf.zsh"
  source_plugin fzf-tab-completion "/usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh" "$HOME/.local/share/fzf-tab-completion/zsh/fzf-zsh-completion.sh"
else
  source_plugin history-search-multiword "$HOME/.local/share/history-search-multi-word/history-search-multi-word.plugin.zsh"
fi

setopt histignorespace
setopt HIST_IGNORE_ALL_DUPS

if [ -f ~/.pystartup ]; then
    export PYTHONSTARTUP=~/.pystartup
fi


if [ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" 
fi

if command -v nvim &> /dev/null; then
  alias vim=nvim
  export VISUAL=nvim
  export DIFFPROG="nvim -d"
  export EDITOR=$VISUAL
else
  echo "nvim not found; please install it."
  if command -v vim &> /dev/null; then
    export VISUAL=vim
    export EDITOR=$VISUAL
  else
    echo "vim also not found; please install it."
  fi
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

if command -v lazygit &> /dev/null; then
  alias lg=lazygit
fi

if command -v lazyjj &> /dev/null; then
  alias lj=lazyjj
fi

if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ]; then
  export GOBIN="$HOME/go/bin"
  export PATH="$GOBIN:$PATH"
fi

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

if command -v eza &> /dev/null; then
    alias ls='eza --icons --group-directories-first'
fi

if command -v bat &> /dev/null; then
    alias cat='bat --paging=never'
fi

[ -f "$HOME/.local/scripts/tmux-sessionizer" ] && bindkey -s ^f " $HOME/.local/scripts/tmux-sessionizer\n"

if command -v starship &> /dev/null; then
    export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
    eval "$(starship init zsh)"
fi
