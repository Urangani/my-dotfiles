# ------------------------------------------------------------------
# INTERACTIVE SHELL GUARD (Critical)
# Prevents running config in non-interactive shells
# ------------------------------------------------------------------
case $- in
    *i*) ;;
      *) return;;
esac

# ------------------------------------------------------------------
# HISTORY SETTINGS (Important for usability)
# Controls how Bash stores and recalls command history
# ------------------------------------------------------------------
HISTCONTROL=ignoreboth      # Ignore duplicates & commands starting with space
shopt -s histappend         # Append history instead of overwrite
HISTSIZE=1000               # In-memory history size
HISTFILESIZE=2000           # On-disk history size





# ------------------------------------------------------------------
# TERMINAL BEHAVIOR (Medium importance)
# Ensures terminal resizing and file previews work smoothly
# ------------------------------------------------------------------
shopt -s checkwinsize        # Auto-update $LINES and $COLUMNS
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"  # Smart 'less'

# ------------------------------------------------------------------
# ALIASES (High importance for productivity)
# Shortcuts for common commands
# ------------------------------------------------------------------
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias opp='open ~'
alias winepy5="wine $HOME/.mt5/drive_c/users/urangani/AppData/Local/Programs/Python/Python311/python.exe"
alias to_clip="~/Scripts/clipboard.sh copy"
alias from_clip="~/Scripts/clipboard.sh paste"
alias lzg="lazygit"
alias lzd="lazydocker"

# Load user-defined aliases if available
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# ------------------------------------------------------------------
# DEFAULT EDITOR (Critical for dev workflows)
# Ensures commands like git commit use Neovim
# ------------------------------------------------------------------
export EDITOR="nvim"

# ------------------------------------------------------------------
# BASH COMPLETION (Medium importance)
# Enables tab completion for commands, filenames, git, etc.
# ------------------------------------------------------------------
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ------------------------------------------------------------------
# LANGUAGE RUNTIMES (Critical for dev environment)
# Node.js (NVM) and SDKMAN for JVM languages
# ------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ------------------------------------------------------------------
# CUSTOM FUNCTIONS (Optional but useful)
# SPF wrapper for superfile lastdir tracking
# ------------------------------------------------------------------
spf() {
    os=$(uname -s)
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi
    command spf "$@"
    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}

# ------------------------------------------------------------------
# PROMPT CUSTOMIZATION (High importance for clarity)
# Shows Python env + current dir + Git branch
# ------------------------------------------------------------------
unset PS1

# ANSI colors
BLUE="\033[0;34m"
GREEN="\033[0;32m"
PURPLE="\033[0;35m"
RESET="\033[0m"

parse_git_branch() {
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
    [[ "$branch" == "HEAD" ]] && return
    printf " ${BLUE} ${GREEN}(%s)${RESET}" "$branch"
}

parse_python_env() {
    [ -n "$VIRTUAL_ENV" ] && printf "${PURPLE}(%s)${RESET} " "$(basename "$VIRTUAL_ENV")"
}


# stop the virtual environment from automatically adding its own (env) to the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

export PS1="\$(parse_python_env)\w  \$(parse_git_branch)\n  "

# ------------------------------------------------------------------
# TOOLCHAINS (Critical for dev workflows)
# Rust, local binaries, and Zoxide smart cd
# ------------------------------------------------------------------
. "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="$HOME/Scripts:$PATH"

eval "$(zoxide init bash)"
eval "$(fzf --bash)"
## Export GO packages
export PATH=$PATH:$(go env GOPATH)/bin

