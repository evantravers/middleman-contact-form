require 'sinatra'
require 'pony'

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

put '/' do
  email = ""
  params.each do |value|
    email += "#{value}: #{params[value]}\n"
  end
  Pony.mail(:to => ENV['email_recipients'], :from => 'noreply@evantravers.com', :subject => 'New Contact Form', :body => email)
end
