ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

require_relative File.expand_path '../../mailer.rb', __FILE__
