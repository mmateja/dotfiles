function set_vagrant_aliases --description 'Set Vagrant aliases'
	echo 'Setting vagrant aliases...'

	abbr vd 'vagrant destroy'
	abbr vgs 'vagrant global-status'
	abbr vh 'vagrant halt'
	abbr vs 'vagrant ssh'
	abbr vu 'vagrant up'
end

