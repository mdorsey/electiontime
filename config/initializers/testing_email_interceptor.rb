# Be sure to restart your server when you modify this file.

class TestingEmailInterceptor
  def self.delivering_email(message)
    original_destination = message.to
    message.to = 'testing@electiontime.org'
    message.subject = "#{message.subject} (originally to #{original_destination})"
  end
end

unless Rails.env.production?
  ActionMailer::Base.register_interceptor(TestingEmailInterceptor)
end