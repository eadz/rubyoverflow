require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rubyoverflow"
    gem.summary = %Q{rubyoverflow is a library for querying the Stack Overflow API}
    gem.description = %Q{rubyoverflow is a library for querying the Stack Overflow API}
    gem.email = "phasor@phsr.org"
    gem.homepage = "http://github.com/phsr/rubyoverflow"
    gem.authors = ["phsr"]
    gem.add_dependency 'httparty', '>=0'
    gem.add_dependency 'hashie', '>=0'
    gem.add_development_dependency "shoulda", ">= 0"
    gem.files.include FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'test/**/*'].to_a
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
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

task :doc => :rdoc

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rubyoverflow #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
