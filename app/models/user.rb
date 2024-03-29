class User < ApplicationRecord
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :remember_token, :activation_token, :reset_token, :current_password

  belongs_to :user_type
  has_many :logs
  has_many :participants
  has_secure_password

  before_save :downcase_email
  before_create :create_activation_digest
  before_destroy :allow_destroy

  validates(:first_name, presence: true, length: { maximum: 255 })
  validates(:last_name, presence: true, length: { maximum: 255 })
  validates(:email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 6 }, allow_nil: true)
  validates(:user_type, presence: true)

  def self.search(search_text)
    if search_text
      where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{search_text}%", "%#{search_text}%", "%#{search_text}%")
    else
      unscoped
    end
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.random_password
    SecureRandom.base64(20)
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account.
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    @subject_location = ContentLocation.find_by(name: "email_password_reset_subject")
    @body_location = ContentLocation.find_by(name: "email_password_reset_body")

    if @subject_location && @body_location
      @subject = Content.find_by(content_location_id: @subject_location.id)
      @body = Content.find_by(content_location_id: @body_location.id)

      if @subject && @body
        UserMailer.password_reset(self, @subject, @body).deliver_now
      else
        return false
      end
    else
      return false
    end
  end

  # Returns true if a password reset has expired (sent earlier than two hours ago)
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def send_welcome_email
    @subject_location = ContentLocation.find_by(name: "email_welcome_subject")
    @body_location = ContentLocation.find_by(name: "email_welcome_body")

    if @subject_location && @body_location
      @subject = Content.find_by(content_location_id: @subject_location.id)
      @body = Content.find_by(content_location_id: @body_location.id)

      if @subject && @body
        UserMailer.welcome(self, @subject, @body).deliver_now
      else
        return false
      end
    else
      return false
    end
  end

  # Returns this user's participants in active elections that occur today or in the future
  def participants_in_future_elections
    Participant.joins(:elections).where("participants.user_id = ? AND elections.active = true AND election_date >= ?", self.id, Time.now.utc.midnight).order(name: :asc)
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    # Before deletion, check if the object is in use
    def allow_destroy
      unless (logs.empty? && participants.empty?)
        throw :abort
      end
    end
end
