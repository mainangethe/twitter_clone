# User model
class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name,
            presence: true,
            length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 100 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password,
            presence: true,
            length: { minimum: 6 }

  # returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # returns a random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # remembers a user in the db for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # returns true if the given token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
end
