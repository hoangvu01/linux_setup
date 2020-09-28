# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [[ -z "$TMUX" ]]; then tmux; fi
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Path to your oh-my-zsh installation.
export ZSH="/home/tbptbp/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history battery virtualenv)

source $ZSH/oh-my-zsh.sh
export VIRTUAL_ENV_DISABLE_PROMPT=0

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"


export TOOLDIR=$HOME/c-tools
export PATH="$TOOLDIR/bin:$TOLLDIR/bin/$ARCH:$PATH"
export MANPATH=${MANPATH}:$TOLLDIR/man

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tbptbp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tbptbp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tbptbp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tbptbp/google-cloud-sdk/completion.zsh.inc'; fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# The following set the prompt
colourise() {
  colour=$1
  message=$2
  echo "%F{$colour}${message}%f"
}
# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
   user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
   user_symbol='#'
elif [[ -n "$USER_SYMBOL" ]]; then
   user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
   user_symbol="$USER_SYMBOL"
else
   user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
   user_symbol='λ'
fi

current_dir='%{$terminfo[bold]%F{24}%}%~%{$reset_color%}'
git_branch='$(git_prompt_info)'
git_signing_key='%F{220}$(git config user.signingKey)%f'
git_user='%F{222}$(git config user.name)%f'
rvm_ruby='$(ruby_prompt_info)'
battery_pct='$(battery_pct_prompt)'
venv_prompt='$(virtualenv_prompt_info | cut -d "[" -f2 | cut -d "]" -f1)'
venv_prompt="%F{82}${venv_prompt}ᘐ%f"

[[ $(date +"%H") -gt "5" ]] && [[ $(date +"%H") -le "17" ]] && time="%F{214}☼ %*%f" || time="%F{24}☽ %*%f"

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

OB="%F{240}—[%f"
CB="%F{240}]—%f"
B="$CB$OB"

emo='$(if [[ "$?" == "0" ]]; then echo "%F{154}(^.^)%f"; else echo "%F{196}{o_o}%f"; fi)'

PROMPT="$(colourise 240 ╭─)${emo}%F{240}[%f${current_dir}$B${venv_prompt}$B${rvm_ruby}${git_branch}$B${git_user}$B${git_signing_key}$B${time}$B${battery_pct}%F{240}]%f
%F{240}╰─→ %f%B%F{50}${user_symbol}%f%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{72}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=""
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=""
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX

# Set personal aliases here
alias icl='cd ~/Desktop/Workspace/ICL/'
alias vncserver-start='sudo systemctl start vncserver-x11-serviced.service'
alias vncserver-enable='sudo systemctl enable vncserver-x11-serviced.service'
alias vncserver-stop='sudo systemctl stop vncserver-x11-serviced.service'
alias vncserver-disable='sudo systemctl disable vncserver-x11-serviced.service'

alias gcurl='curl -H "Authorization: Bearer $(print-identity-token)"'

alias source-aai='source ~/env/aai/dev/bin/activate'
alias cd-aai='cd /home/tbptbp/Desktop/Workspace/AAI/'
alias watchdog='cd ~/Desktop/Workspace/AAI/watchdog; source env/bin/activate'
alias bloomberg='cd ~/Desktop/Workspace/AAI/nessie; source bbg/bin/activate'


source <(kubectl completion zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
