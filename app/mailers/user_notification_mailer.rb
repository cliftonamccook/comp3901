class UserNotificationMailer < ApplicationMailer
  default :from => 'uwipocketadvisor@gmail.com'

  def send_credentials(user)
    @user = user
    mail(to: @user.email, subject: "UWI Pocket Advisor - Account Information")
  end
end
