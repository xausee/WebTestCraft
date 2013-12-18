$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
p Dir.pwd
Dir.chdir (File.expand_path(File.dirname(__FILE__)) )
p Dir.pwd
require "../../../../core/browser.rb"
