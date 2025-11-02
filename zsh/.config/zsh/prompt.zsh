setopt prompt_subst

precmd() {
    LAST_EXIT_CODE=$?
}

working_dir() {
    local background color output

    if [[ $PWD == $HOME ]]; then
        output=" "
    elif [[ $PWD == $HOME/* ]]; then
        output=" /${PWD#$HOME/}"
    else 
        output="/${PWD#/}"
    fi

    if [[ $LAST_EXIT_CODE -eq 0 ]]; then
        color="255"
        background="blue"
    else
        color="255"
        background="red"
    fi

    echo "%F{$background}%K{$background}%F{$color}$output%k%F{$background}%f"
}

git_info() {
    git rev-parse --is-inside-worktree &>/dev/null || return

    local branch background staged unstaged ahead behind arrows color
    branch=$(git symbolic-ref --short -q HEAD 2>/dev/null || git rev-parse --short HEAD)

    ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
    behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)

    while IFS= read -r line; do
        [[ -z "$line" ]] && continue
        [[ "${line[1]}" != " " ]] && staged=1
        [[ "${line[2]}" != " " ]] && unstaged=1
    done < <(git status --porcelain 2>/dev/null)

    color="255"
    if (( ahead > 0 && behind > 0 )); then
        background="red"             # diverged, both ahead.
    elif (( behind > 0 )); then
        background="cyan"            # behind only
        color="0"
    elif (( ahead > 0 )); then
        background="magenta"         # ahead only
    elif [[ -n $unstaged ]]; then
        background="yellow"          # dirty (unstaged)
        color="0"
    elif [[ -n $staged ]]; then
        background="blue"            # staged
    else
        background="green"           # clean
        color="0"
    fi

    (( ahead > 0 ))  && arrows+="$ahead "
    (( behind > 0 )) && arrows+="$behind "

    echo "%F{$background}%F{$color}%K{$background} 󰘬 $branch $arrows%k%F{$background}%f"
}

PROMPT='$(working_dir) '
RPROMPT='$(git_info)'