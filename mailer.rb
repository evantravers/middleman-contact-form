require 'sinatra'
require 'pony'

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
  # Pony.mail(:to => ENV['email_recipients'], :from => 'noreply@example.com', :subject => 'New Contact Form', :body => email)
end
