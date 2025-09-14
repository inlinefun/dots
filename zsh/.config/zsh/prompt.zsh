
setopt prompt_subst

precmd() {
  LAST_EXIT_CODE=$? # used by indicator at working dir
}

working_dir() {
  local output background

  if [[ $PWD == $HOME ]]; then
    output=" "
  elif [[ $PWD == $HOME/* ]]; then
    output=" /${PWD#$HOME/}"
  else
    output="/${PWD#/}"
  fi

  if [[ $LAST_EXIT_CODE -eq 0 ]]; then
    background="blue"
  else 
    background="red"
  fi
  
  echo "%F{$background}%K{$background}%F{white}$output%k%F{$background}"
}

git_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch color staged unstaged
  branch=$(git symbolic-ref --short -q HEAD 2>/dev/null || git rev-parse --short HEAD)

  local ahead behind
  ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
  behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)

  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    [[ "${line[1]}" != " " ]] && staged=1
    [[ "${line[2]}" != " " ]] && unstaged=1
  done < <(git status --porcelain 2>/dev/null)

  if (( ahead > 0 && behind > 0 )); then
    color="red"             # diverged, both ahead.
  elif (( behind > 0 )); then
    color="orange"          # behind only
  elif (( ahead > 0 )); then
    color="magenta"         # ahead only
  elif [[ -n $unstaged ]]; then
    color="yellow"          # dirty (unstaged)
  elif [[ -n $staged ]]; then
    color="blue"            # staged
  else
    color="green"           # clean
  fi

  local arrows=""
  (( ahead > 0 ))  && arrows+="↑$ahead "
  (( behind > 0 )) && arrows+="↓$behind "

  echo "%F{$color}%K{$color}%F{white} $branch $arrows%k%F{$color}"
}


PROMPT='$(working_dir)%f '
RPROMPT='$(git_info)'
