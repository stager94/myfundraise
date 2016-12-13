class CustomMailer < ActionMailer::Base

  def question(email, text)
    @text = text
    mail to: "stager94@gmail.com", from: email, subject: "New message from MyFundraise"
  end

end
