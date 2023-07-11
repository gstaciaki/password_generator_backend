class User < ApplicationRecord
  before_create :generate_hash_id
  self.primary_key = "hash_id"

  private

  def generate_hash_id
    self.hash_id = SecureRandom.hex(16)
  end
end
