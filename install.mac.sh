#!/bin/bash

brew update


######################### Brew Packages #########################

brew install \
	fish \
	fisher \
	spacedust \
	bat \
	awscli \
	git \
	git-delta \
	go-task \
	htop \
	node \
	vlc \
	pwgen \
	tig \
	watch \
	zoxide \
	colima \
	docker \
	gh \
	fzf


######################### Cask Packages #########################

# Browsers
brew install --cask \
	firefox \
	firefox@developer-edition \
	brave-browser

# Communication
brew install --cask \
	slack \
	signal \
	messenger \
	whatsapp \
	microsoft-teams \
	zoom

# Editors
brew install --cask \
	cursor \
	rubymine

# Music / Video
brew install --cask \
	spotify \
	reaper \
	losslesscut

# File Sharing
brew install --cask \
	google-drive \
	localsend \
	openmtp

# Productivity
brew install --cask \
	rectangle \
	notion \
	todoist \
	libreoffice

# Other
brew install --cask \
	iterm2 \
	font-victor-mono-nerd-font \
	gramps
