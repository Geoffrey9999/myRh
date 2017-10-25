# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
    :adress       => 'smtp.gmail.com',
    :port         => 587,
    :domain       => 'gmail.com',
    :user_name    => 'yourmail@gmail.com',
    :password     => 'yourpassword',
    :authentication => 'plain',
    :enable_starttls_auto => true,
}

# Initialize the Rails application.
Rails.application.initialize!
