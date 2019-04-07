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

def symlink(repo_path, home_dir_path)
  source_file_path = File.join(File.dirname(File.absolute_path(__FILE__)), repo_path)
  target_file_path = File.join(Dir.home, home_dir_path)

  if !File.exists?(target_file_path)
    File.symlink(source_file_path, target_file_path)
    puts "#{highlight_color(home_dir_path)} - linked"
  else
    puts "#{highlight_color(home_dir_path)} - #{warn_color('already exists')}"
  end
end

def section(name)
  puts "===> #{section_name_color(name)} <==="
  yield
  puts
end

section('vim') do
  symlink('vim/vimrc', '.vimrc')
end

section('git') do
  symlink('git/gitconfig', '.gitconfig')
end

section('fish') do
  Dir['fish/functions/*.fish'].each do |function_file|
    symlink(function_file, File.join('.config/fish/functions', File.basename(function_file)))
  end
  symlink('fish/fishfile', '.config/fish/fishfile')
end

puts 'symlinking finished'
puts 'run \'fisher\' to install fish dependencies'
puts 'run \'setup_environment\' command to load fish configuration'
