require "rubygems"
require "cucumber/rake/task"
require "spec/rake/spectask"

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty"
end


Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['test/**/*_spec.rb']
end

task :default => [:spec, :cucumber]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "web-app-theme"
    gemspec.summary = "Web app theme generator"
    gemspec.description = "Web app theme generator for rails projects"
    gemspec.email = "andrea@gravityblast.com"
    gemspec.homepage = "http://github.com/pilu/web-app-theme"
    gemspec.authors = ["Andrea Franz"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'aruba/api'

class GemsetsForTesting
  include Aruba::Api
  def setup
    use_rvm "1.8.7"
    use_rvm_gemset "web-app-theme-2.3.5", false
    install_gems """
    gem 'rails', '2.3.5'
    gem 'sqlite3-ruby', '1.2.5'
    """

    use_rvm "1.8.7"
    use_rvm_gemset "web-app-theme-3", false
    install_gems """
    gem 'rails', '3.0.0.beta3'
    gem 'sqlite3-ruby', '1.2.5'
    """
  end
end

task :setup_gemsets do
  GemsetsForTesting.new.setup
end