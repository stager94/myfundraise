class CustomQuestion < ActiveRecord::Base

  after_create :send_message

  def send_message
    CustomMailer.question(self.email, self.text).deliver_now
  end

end
