task :default
  ENV['RACK_ENV'] = 'test'

  require './mailer'
  require 'test/unit'
  require 'rack/test'

  class MailerTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def app
      Sinatra::Application
    end

    def test_it_says_hello_world
      get '/'
      assert last_response.ok?
      assert_equal 'you have reached the test!', last_response.body
    end
  end
