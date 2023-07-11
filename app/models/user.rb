class User < ApplicationRecord
  before_validation :check_email
  before_create :generate_hash_id
  self.primary_key = "hash_id"

  private

  def generate_hash_id
    self.hash_id = SecureRandom.hex(16)
  end

  def check_email
    errors.add(:email, "Email already exists") if User.exists?(email: email)
  end
end
