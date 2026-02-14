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
	docker \
	gh \
	fzf \
	gdu \
	rsync


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
	whatsapp \
	microsoft-teams \
	zoom \
	caprine

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


######################### Custom Software #########################

# https://github.com/AlexStrNik/Browserino
brew tap AlexStrNik/Browserino
brew install browserino --no-quarantine
