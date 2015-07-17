$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
$CUCUMBER_CURRENT_PATH =  Dir.pwd
$ROOT_PATH = File.expand_path(File.dirname(__FILE__)) + '/../../../../'
$LOAD_PATH.unshift($ROOT_PATH)
require 'core/load_framework.rb'



