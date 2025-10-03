function clean-branchesi -d "Select and remove local branches"
	git branch -v | grep '[gone]' | awk '{print $1}' | fzf -m --header "Select branches with TAB and hit ENTER to
	remove them" | xargs git branch -D
end

