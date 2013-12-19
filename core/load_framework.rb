require 'env'

def load_files(files_array)
  files_array.each do |file|
    if (!$LOADED_FEATURES.include? file) && (__FILE__ != file)
      load file
    end
  end
end

puts 'load core files...'
load_files Dir[File.join(File.dirname(__FILE__), '*.rb')]

puts 'load widgets help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'widgets', '*.rb')]

puts 'load pages help files...'
load_files Dir[File.join(File.dirname(__FILE__),'..', 'helpers', 'pages', '*.rb')]
