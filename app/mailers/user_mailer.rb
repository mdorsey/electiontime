class UserMailer < ApplicationMailer

  default from: "ElectionTime.org <contact@electiontime.org>"

  def account_activation(user)
    @user = user
    mail to: @user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password reset"
  end

  def welcome(user)
    @user = user
    mail to: @user.email, subject: "Welcome"
  end
end
