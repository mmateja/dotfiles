function clean-branches -d "Select and remove local branches"
	git branch -v | \
		grep '[gone]' | \
		awk '{print $1}' | \
		fzf -m --header "Mark branches with TAB and hit ENTER to remove selected" | \
		xargs git branch -D
end

