require 'tty-prompt'
require 'bundler'
require 'require_all'

# Load the Rails application.
require_relative 'application'

# require 'pry'
# binding.pry

# Initialize the Rails application.
Rails.application.initialize!

Bundler.require
require_all 'lib'
