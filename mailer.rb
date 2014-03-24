require 'sinatra'
require 'pony'

# This before filter is to address Cross-origin resource sharing (CORS) issue with Ajax submission of contect form.
# Solutions was found here: http://stackoverflow.com/questions/17027117/jquery-ajax-request-to-sinatra-app-blocked-by-cors
# Before filters are evaluated before each request within the context of the request and can modify the request and response.
# Context for before filters in sinatra: http://www.sinatrarb.com/intro?name=filters#Filters

before do
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
end

set :protection, :origin_whitelist => [ENV['white_site']]

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

get '/' do
  'you have reached the test!'
end

post '/' do
  email = ""
  params.each do |value|
    email += "#{value[0]}: #{value[1]}\n"
  end
  puts email
  Pony.mail(:to => ENV['email_recipients'], :from => 'noreply@example.com', :subject => 'New Contact Form', :body => email)
end
