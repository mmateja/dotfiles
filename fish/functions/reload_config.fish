function reload_config --description 'Reload configuration from repository'
	echo 'Reloading configuration...'

	set_general_config
	set_git_aliases

	echo 'Done.'
end

