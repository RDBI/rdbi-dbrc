require 'rubygems'
gem 'test-unit'
require 'test/unit'
gem 'rdbi-driver-mock'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rdbi-dbrc'
require 'rdbi/driver/mock'

class Test::Unit::TestCase
  def setup
    ENV["DBRC"] = File.join(File.dirname(__FILE__), 'dbrc')
  end
end
