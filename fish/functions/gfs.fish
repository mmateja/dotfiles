function gfs -d "git fuzzy switch"
    set query $argv[1]

    set branch (git branch --format='%(refname:short)' | fzf --query="$query")

    if test -n "$branch"
        git switch $branch
    end
end
