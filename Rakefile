require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rdbi-dbrc"
    gem.summary = %Q{Implementation of dbi-dbrc for RDBI}
    gem.description = %Q{Implementation of dbi-dbrc for RDBI}
    gem.email = "erik@hollensbe.org"
    gem.homepage = "http://github.com/erikh/rdbi-dbrc"
    gem.authors = ["Erik Hollensbe"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
   
    gem.add_dependency 'rdbi'
    gem.add_development_dependency 'rdbi-driver-mock'
    gem.add_development_dependency 'test-unit'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

gem 'rdoc'
require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.generator = 'hanna'
  rdoc.main = 'README.rdoc'
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rdbi-dbrc #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
