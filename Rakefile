require 'rake/testtask'
task :default => :test

desc 'Run tests'
Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/*_test.rb']
  t.ruby_opts = ['-Itest']
  t.ruby_opts << '-rubygems' if defined? Gem
end
