# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Flightlog::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app18550613@heroku.com'],
  :password       => ENV['jiwmorob'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}