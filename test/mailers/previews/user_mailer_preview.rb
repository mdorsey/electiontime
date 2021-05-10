# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    subject_location = ContentLocation.find_by(name: "email_password_reset_subject")
    body_location = ContentLocation.find_by(name: "email_password_reset_body")
    subject = Content.find_by(content_location_id: subject_location.id)
    body = Content.find_by(content_location_id: body_location.id)
    UserMailer.password_reset(user, subject, body)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first
    subject_location = ContentLocation.find_by(name: "email_welcome_subject")
    body_location = ContentLocation.find_by(name: "email_welcome_body")
    subject = Content.find_by(content_location_id: subject_location.id)
    body = Content.find_by(content_location_id: body_location.id)
    UserMailer.welcome(user, subject, body)
  end
end
