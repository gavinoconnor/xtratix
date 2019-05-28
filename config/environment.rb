# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

require 'songkickr'
remote = Songkickr::Remote.new('nu80rqJInvFVVDU4')
