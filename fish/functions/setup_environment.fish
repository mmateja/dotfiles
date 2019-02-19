function setup_environment --description 'Load configuration from the repository'
	echo 'Loading configuration...'

	set_general_config
	set_git_aliases

	echo 'Done.'
end

