abbr g		'git'

abbr ga		'git add'
abbr gai	'git add -i'
abbr gap	'git add -p'

abbr gbs	'git bisect'
abbr gbl	'git blame'
abbr gb		'git branch'
abbr gba	'git branch -a'

abbr gc		'git commit -v'
abbr gc!	'git commit -v --amend'
abbr gca	'git commit -v -a'
abbr gca!	'git commit -v -a --amend'
abbr gco	'git checkout'
abbr gcm	'git checkout -m'
abbr gcb	'git checkout -b'
abbr gcd	'git checkout develop'
abbr gcp	'git cherry-pick'
abbr gcl	'git clone'
abbr gclr	'git clean -fd'

abbr gd		'git diff'
abbr gds	'git diff --stat'
abbr gdc	'git diff --cached'
abbr gdo	'git diff origin/(git_branch_name)'

abbr gf		'git fetch'

abbr ggr	'git grep -i -n --break --heading'

abbr gl		'git log'

abbr gm		'git merge'
abbr gmff	'git merge --ff-only'

abbr gpl	'git pull'
abbr gplr	'git pull --rebase'

abbr gp		'git push origin (git_branch_name)'
abbr gp!	'git push -f origin (git_branch_name)'
abbr gpt	'git push --tags origin (git_branch_name)'

abbr grb	'git rebase'
abbr grba	'git rebase --abort'
abbr grbc	'git rebase --continue'
abbr grbi	'git rebase -i'
abbr grbd	'git rebase origin/develop'
abbr gr		'git reset'
abbr ggrh	'git reset --hard origin/(git_branch_name)'
abbr grh	'git reset --hard'
abbr grhh	'git reset --hard HEAD'
abbr grs	'git reset --soft'

abbr gsh	'git show'
abbr gs		'git stash'
abbr gsa	'git stash apply'
abbr gsd	'git stash drop'
abbr gsl	'git stash list'
abbr gsp	'git stash pop'
abbr gss	'git stash show -p'
abbr gst	'git status'

function gdos
	if count $argv > /dev/null
		set branch $argv
	else
		set branch (git_branch_name)
	end
	git fetch --quiet
	git --no-pager diff --stat $branch origin/$branch
end

