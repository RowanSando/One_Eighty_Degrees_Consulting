class UserNotifier < ApplicationMailer
  default from: '180degreesconsultingnotify@gmail.com'
 
  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: 'Notification from 180 Degrees Consulting')
  end
end
