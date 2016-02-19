#!/usr/bin/env ruby

def refs()
  refs = `git show-ref --dereference --heads`
  lines = refs.split(/\r?\n/)
  refs = {}
  lines.each do |line|
    columns = line.split(' ')
    hash = columns[0]
    ref = columns[1].sub(/^refs\/heads\//, '')

    if refs[hash]
      refs[hash] << ref
    else
      refs[hash] = [ref]
    end
  end
  refs
end

def refs_for_hash(refs_hash, commit_hash)
  refs_hash.each do |hash, refs|
    return refs if hash.start_with?(commit_hash.to_s)
  end
  []
end

todo_file = ARGV[0]

refs_hash = refs()

actual_branch = `git rev-parse --abbrev-ref HEAD`.strip
branches_to_push = []

File.open(todo_file, 'r').each_line do |line|
  data = line.split(' ', 3)
  commit = data[1]
  puts line

  if data.size == 3
    refs_for_hash(refs_hash, commit).each do |ref|
      branches_to_push << ref
      puts "exec git branch -f #{ref}" if ref != actual_branch
    end
  end
end

File.open('/tmp/chain_rebase_push_script.sh', 'w') do |f|
  f.write("#!/bin/bash\n\n");

  f.write("source #{File.join(File.dirname(__FILE__), '/push_branches.sh')}\n")

  branches_to_push.each do |branch|
    f.write("push_branch #{branch}\n")
  end
end
