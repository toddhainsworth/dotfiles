# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git grunt gulp node npm rbenv ruby vundle yum zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/bin
export DENO_INSTALL="/home/todd.hainsworth/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH=$PATH:$HOME/Library/Python/3.8/bin
fi

alias showme="nautilus"
alias fixi3="xrandr --output HDMI1 --auto --right-of HDMI2"
alias ff="find -name"
alias composer.phar="composer"
alias phpstorm="(~/bin/phpstorm/PhpStorm-162.1889.1/bin/phpstorm.sh &) && disown"
alias www02ssh="ssh deploy@www02.aligent.com.au"
alias c="clear"
alias composer-no-bs="composer --prefer-dist --no-plugins"
alias cf="n98-magerun.phar cache:flush"
alias weather="curl -4 http://wttr.in/Adelaide"
alias reattach="tmux attach -t "
alias mux="tmuxinator"
alias v="./vessel"
alias nv="nvim"
alias gap="git add -p"
alias eroma-deploy="git push cloud"
alias emacs="emacs -nw"

function grepFor() {
  grep -Po '<string to search for>\K[^<next char>]+' exception.log|sort|uniq
}

function laranew() {
  composer create-project --prefer-dist laravel/laravel $1 \
    && cd $1 \
    && composer require laravel/homestead --dev \
    && php vendor/bin/homestead make;
}

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

LOCHOME=${HOME:-'/home/todd.hainsworth'}
export PATH="$LOCHOME/"'.magento-cloud/bin':"$PATH"
if [ -f "$LOCHOME/"'.magento-cloud/shell-config.rc' ]; then . "$LOCHOME/"'.magento-cloud/shell-config.rc'; fi

# AWS Jumphost stuff
source ~/bin/jump

if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
eval "$(rbenv init - zsh)"

# I've got some Pert dependencies as part of Neovim on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    PATH="/Users/toddhainsworth/perl5/bin${PATH:+:${PATH}}"; export PATH;
    PERL5LIB="/Users/toddhainsworth/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
    PERL_LOCAL_LIB_ROOT="/Users/toddhainsworth/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
    PERL_MB_OPT="--install_base \"/Users/toddhainsworth/perl5\""; export PERL_MB_OPT;
    PERL_MM_OPT="INSTALL_BASE=/Users/toddhainsworth/perl5"; export PERL_MM_OPT;
fi
