require File.expand_path '../test_helper.rb', __FILE__

class MyTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_gets
    get '/'
    assert last_response.ok?
    assert_equal "you have reached the test!", last_response.body
  end

  def test_puts
    put '/'
    assert last_response.ok?
    assert_equal "how did you do that you stinker?", last_response.body
  end
end
