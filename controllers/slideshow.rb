require 'sinatra'

set :public_folder, 'public'
set :views, 'views'
set :logging, false

set :bind, '0.0.0.0'
set :show_exceptions, false

if $unit_test then 
	# We keep this for unit testing
	# We have to think of a way to solve this
	enable :sessions; set :session_secret, 'secret'
else
	# The code above does not seem to work with chrome (session disappears)
	# It looks like the erb execution make the session dissapear with chrome
	# We can replace it with this one :
	use Rack::Session::Cookie, :key => 'rack.session',
	                            :path => '/',
	                            :secret => 'secret'
end

require_relative 'slideshow_helper'

require_relative "slideshow-login"
require_relative "slideshow-polls"
require_relative "slideshow-code"
require_relative "slideshow-admin"
require_relative "slideshow-current_slide"