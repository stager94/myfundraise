class CustomMailer < ActionMailer::Base

  def question(email, text)
    @text = text
    mail to: "stager94@gmail.com", from: email, subject: "New message from MyFundraise"
  end

  def withdraw(withdraw_id)
    @withdraw = Withdraw.find withdraw_id
    @campaign = @withdraw.campaign
    mail to: "stager94@gmail.com", from: @withdraw.campaign.user.email, subject: "New withdraw"
  end

end
