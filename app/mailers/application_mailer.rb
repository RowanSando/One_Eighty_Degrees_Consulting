class ApplicationMailer < ActionMailer::Base
  default :from => 'any_from_address@example.com'
  layout 'mailer'
end
