$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
def load_files(files_array)
  files_array.each do |file|
    if (!$LOADED_FEATURES.include? file) && (__FILE__ != file)
      load file
    end
  end
end
#$env.logger.info 'load overrides files...'
load_files Dir[File.join(File.dirname(__FILE__), 'overrides','*.rb')]

require 'env'

$env.logger.info 'load core files...'
load_files Dir[File.join(File.dirname(__FILE__), '*.rb')]

$env.logger.info 'load mobile widgets help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'mobile', 'widgets', '*.rb')]

$env.logger.info 'load mobile pages help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'mobile', 'pages', '*.rb')]

$env.logger.info 'load mobile common step files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'mobile', 'step_definitions', '*.rb')]

$env.logger.info 'load pc widgets help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'pc', 'widgets', '*.rb')]

$env.logger.info 'load pc pages help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'pc', 'pages', '*.rb')]

$env.logger.info 'load pc common step files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'pc', 'step_definitions', '*.rb')]
