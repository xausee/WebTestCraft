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

  desc "run cucumber example test case under projects folder."
  task :example do
    ENV['CUCUMBER_OPTS'] = create_options "example"
    Rake::Task['test:start'].invoke()
  end
end