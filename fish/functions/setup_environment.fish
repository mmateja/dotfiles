function setup_environment --description 'Load configuration from the repository'
	echo 'Loading configuration...'

	set_general_config
	fish_update_completions

	echo 'Done.'
end

