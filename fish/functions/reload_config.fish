function reload_config --description 'Reload configuration from repository'
	echo 'Reloading configuration...'

	set_general_config
	set --erase fish_user_abbreviations
	set_git_aliases

	echo 'Done.'
end

