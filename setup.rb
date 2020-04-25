#!/usr/bin/env ruby

# Script symlinks config files from the repository to user's home dir

def highlight_color(string)
  "\e[32m#{string}\e[0m"
end

def warn_color(string)
  "\e[31m#{string}\e[0m"
end

def section_name_color(string)
  "\e[33m#{string}\e[0m"
end

def dotfiles_dir
  File.dirname(File.absolute_path(__FILE__))
end

def home_relative_path(path)
  File.join(Dir.home, path)
end

def symlink(repo_path, home_dir_path)
  source_file_path = File.join(dotfiles_dir, repo_path)
  target_file_path = home_relative_path(home_dir_path)

  if !File.exists?(target_file_path)
    File.symlink(source_file_path, target_file_path)
    puts "#{highlight_color(target_file_path)} - linked"
  else
    puts "#{highlight_color(target_file_path)} - #{warn_color('already exists')}"
  end
end

def create(home_dir_path, content, executable: false)
  target_file_path = home_relative_path(home_dir_path)

  if !File.exists?(target_file_path)
    File.write(target_file_path, content)
    `chmod +x #{target_file_path}` if executable
    puts "#{highlight_color(target_file_path)} - created"
  else
    puts "#{highlight_color(target_file_path)} - #{warn_color('already exists')}"
  end
end

def section(name)
  puts "===> #{section_name_color(name)} <==="
  yield
  puts
end

section('XDG base directory configuration') do
  create('.profile', <<~SCRIPT)
    export XDG_CONFIG_HOME=#{dotfiles_dir}
    export XDG_DATA_HOME=#{Dir.home}/.data
  SCRIPT
end

section('Fish login script') do
  create('.fish-login.sh', <<~SCRIPT, executable: true)
    #!/bin/sh -l
    # run sh first to read ~/.profile and set XDG environment variables
    exec -l fish "$@"
  SCRIPT

  puts 'Set the above file as the login command'
end

section('vim') do
  symlink('vim/vimrc', '.vimrc')
end

puts 'Setting configuration finished'
puts '1. Install Fish (https://fishshell.com/)'
puts '2. Install Fisher (https://github.com/jorgebucaran/fisher)'
