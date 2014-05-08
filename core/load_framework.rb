require 'env'

def load_files(files_array)
  files_array.each do |file|
    if (!$LOADED_FEATURES.include? file) && (__FILE__ != file)
      load file
    end
  end
end

#$env.logger.info
puts 'load overrides files...'
load_files Dir[File.join(File.dirname(__FILE__), 'overrides','*.rb')]

puts 'load core files...'
load_files Dir[File.join(File.dirname(__FILE__), '*.rb')]

puts 'load widgets help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'widgets', '*.rb')]

puts 'load pages help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'pages', '*.rb')]

puts 'load common step files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'common_step_definitions', '*.rb')]
