require 'helper'

class TestDBRC < Test::Unit::TestCase
  def test_01_roles
    hash = RDBI::DBRC.roles
    assert(hash)
    assert(hash.has_key?(:mock1))
    assert(hash[:mock1].has_key?(:driver))
    assert_equal(hash[:mock1][:driver], "Mock")
  end

  def test_02_connect
    dbh = RDBI::DBRC.connect(:mock1)
    assert(dbh)
    assert(dbh.connected?)
    assert_kind_of(RDBI::Driver::Mock, dbh.driver)
    assert(dbh.connect_args.has_key?(:username))
    assert_equal(dbh.connect_args[:username], "some_username") 
    assert(dbh.connect_args.has_key?(:password))
    assert_equal(dbh.connect_args[:password], "some_password") 
  end
end
