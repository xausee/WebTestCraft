require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :default => :example

# desc "run cucumber example test case under projects folder."
# Cucumber::Rake::Task.new(:example) do |t|
#   t.cucumber_opts = "projects/example/features --format pretty"
# end

namespace :test do
  Cucumber::Rake::Task.new(:start) do |task|
    #options are set using environment instead
  end

  def create_options(project_name, extra_opts = 'BROWSER="FIREFOX" DEBUG="ON"')
    Dir::mkdir('results') if not File.directory?('results')
    opts = []
    opts += ["projects/#{project_name}"]
    opts += ["--require", "projects/#{project_name}/features"]
    opts += ["--format pretty"]
    opts += ["--format html --out results/reports.html"]
    opts += [extra_opts]
    return opts.join(" ")
  end

  def create_options_with_profile(project_name, profile, extra_opts = 'BROWSER="FIREFOX" DEBUG="ON"')
    Dir::mkdir('results') if not File.directory?('results')
    opts = []
    opts = ["--profile", "#{profile}"]
    opts += ["projects/#{project_name}"]
    opts += ["--require", "projects/#{project_name}/features"]
    opts += [extra_opts]
    return opts.join(" ")
  end

  desc "run cucumber example test case under projects folder.
Usage:
      bundle exec rake test:example"
  task :example do
    ENV['CUCUMBER_OPTS'] = create_options "example"
    Rake::Task['test:start'].invoke()
  end

  desc "Run specified test in a given project folder
Usage:
      bundle exec rake test:project[example,'BROWSER=chrome DEBUG=ON']
Or
      bundle exec rake test:project[example]"
  task :project, [:project_name, :extra_opts] do |t, args|
    ENV['CUCUMBER_OPTS'] = create_options args[:project_name], args[:extra_opts]
    Rake::Task['test:start'].invoke()
  end

  task :project_with_profile, [:project_name, :profile, :extra_opts] do |t, args|
    ENV['CUCUMBER_OPTS'] = create_options_with_profile args[:project_name], args[:profile], args[:extra_opts]
    Rake::Task['test:start'].invoke()
  end
end