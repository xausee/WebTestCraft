$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'env'

def load_files(files_array)
  files_array.each do |file|
    if (!$LOADED_FEATURES.include? file) && (__FILE__ != file)
      load file
    end
  end
end

$env.logger.info 'load overrides files...'
load_files Dir[File.join(File.dirname(__FILE__), 'overrides','*.rb')]

$env.logger.info 'load core files...'
load_files Dir[File.join(File.dirname(__FILE__), '*.rb')]

$env.logger.info 'load widgets help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'widgets', '*.rb')]

$env.logger.info 'load pages help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'pages', '*.rb')]

$env.logger.info 'load common step files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'common_step_definitions', '*.rb')]
