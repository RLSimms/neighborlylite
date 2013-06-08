class UserMailer < ActionMailer::Base
  default from: ENV['gmail_username']

  def welcome(user)
    @name = user.name
    @url  = 'http://localhost:3000/sessions/new'
    mail to: user.email, subject: "Welcome to Neighborly!"

  end


end
