
setopt prompt_subst

precmd() {
  LAST_EXIT_CODE=$? # used by indicator at working dir
}

working_dir() {
  local output background color

  if [[ $PWD == $HOME ]]; then
    output=" "
  elif [[ $PWD == $HOME/* ]]; then
    output=" /${PWD#$HOME/}"
  else
    output="/${PWD#/}"
  fi

  if [[ $LAST_EXIT_CODE -eq 0 ]]; then
    background="blue"
    color="255"
  else 
    background="red"
    color="196"
  fi
  
  echo "%F{$background}%K{$background}%F{$color}$output%k%F{$background}"
}

git_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch color staged unstaged ahead behind arrows text
  branch=$(git symbolic-ref --short -q HEAD 2>/dev/null || git rev-parse --short HEAD)

  ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
  behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)

  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    [[ "${line[1]}" != " " ]] && staged=1
    [[ "${line[2]}" != " " ]] && unstaged=1
  done < <(git status --porcelain 2>/dev/null)

  text="white"
  if (( ahead > 0 && behind > 0 )); then
    color="red"             # diverged, both ahead.
    text="196"
  elif (( behind > 0 )); then
    color="orange"          # behind only
  elif (( ahead > 0 )); then
    color="magenta"         # ahead only
    text="255"
  elif [[ -n $unstaged ]]; then
    color="yellow"          # dirty (unstaged)
  elif [[ -n $staged ]]; then
    color="blue"            # staged
  else
    color="green"           # clean
  fi

  (( ahead > 0 ))  && arrows+="↑$ahead "
  (( behind > 0 )) && arrows+="↓$behind "

  echo "%F{$color}%K{$color}%F{$text} $branch $arrows%k%F{$color}"
}


PROMPT='$(working_dir)%f '
RPROMPT='$(git_info)'
