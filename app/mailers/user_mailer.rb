class UserMailer < ApplicationMailer

  include ActionView::Helpers::TextHelper

  default from: "ElectionTime.org <contact@electiontime.org>"

  def account_activation(user)
    @user = user
    mail(to: @user.email, subject: "Account activation")
  end

  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: "Password reset")
  end

  def welcome(user, subject, body)
    @user = user
    @subject = subject
    @body = body

    @body_formatted_html = @body.content % { :first_name => @user.first_name, :last_name => @user.last_name }
    @body_formatted_text = strip_tags(@body_formatted_html)

    mail(to: @user.email, subject: strip_tags(@subject.content))
  end
end
