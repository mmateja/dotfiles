function setup_environment --description 'Load configuration from the repository'
	echo 'Loading configuration...'

	set_general_config
	set_git_aliases
	set_vagrant_aliases
	fish_update_completions

	echo 'Done.'
end

