# Put your custom themes in this folder.

colourise() {
  colour=$1
  message=$2
  echo "%F{$colour}${message}%f"
}

# The following set the prompt
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
venv_prompt="$(colourise 82 ᘐ${venv_prompt})"

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
