# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="afowler" # set by `omz`


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    autoupdate
    zsh-autosuggestions
    fast-syntax-highlighting
)

if [ -f "$HOME/.nix-profile/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]; then
  source "$HOME/.nix-profile/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
fi

if [ -f "$HOME/.nix-profile/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
  source "$HOME/.nix-profile/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
  export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Path export values
[[ ! -r /home/masonf/.opam/opam-init/init.zsh ]] || source /home/masonf/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.tailwind
export PATH="$PATH:/opt/mssql-tools18/bin"
## ASDF configuration
export PATH="$PATH:/home/masonf/.asdf/"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"


export LD_LIBRARY_PATH="/home/masonf/Projects/It/cc_mas_db_svc/clidriver/lib"

# opam configuration

alias jump=". ~/.local/scripts/jump.sh"
alias sesh="~/.local/scripts/tmux-sessionizer"
alias start=". ~/.local/scripts/startup"
alias sql=". ~/.local/scripts/sql"


# Node Version Manager for npm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export UPDATE_ZSH_DAYS=10
export REDDIX_FORCE_KITTY=1

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
#table

# Created by `pipx` on 2026-05-01 15:56:34
export PATH="$PATH:/home/masonf/.local/bin"

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/home/masonf/.lmstudio/bin"
export PATH="$PATH:$HOME/.odin/"
export CREWAI_DISABLE_TELEMETRY="true"
export OTEL_SDK_DISABLED="true"
export OPENAI_API_KEY="local-stub-value" 

# opencode
export PATH=/home/masonf/.opencode/bin:$PATH

# bun completions
[ -s "/home/masonf/.bun/_bun" ] && source "/home/masonf/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/home/masonf/.local/bin:$PATH"
eval "$(devenv hook zsh)"

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# Optional terminfo bindings for high compatibility
if [[ -n "${terminfo[kcuu1]}" ]]; then
  bindkey "${terminfo[kcuu1]}" history-substring-search-up
fi
if [[ -n "${terminfo[kcud1]}" ]]; then
  bindkey "${terminfo[kcud1]}" history-substring-search-down
fi

if [ -f ~/.zsh_vim ]; then
  source ~/.zsh_vim
fi
