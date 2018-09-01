require "bundler/gem_tasks"
task :default => :spec

desc 'Run formatting by rufo'
task :rufo do
  fork do
    exec("rufo Gemfile lib bin examples tools")
  end

  Process.wait
end

desc 'Run system integration testing'
task :sit do
  fork do
    exec("ruby tools/sit/sit.rb")
  end

  Process.wait
end

desc 'Update expectation of system integration testing'
task :sit_update do
  fork do
    exec("ruby tools/sit/sit_update.rb")
  end

  Process.wait
end
