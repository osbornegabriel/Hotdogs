require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :valid_password

  def valid_password
    if @input_hotdog.nil?
      self.errors.add(:BANANAS, "can't be blank")
    elsif @input_hotdog.length < 6
      self.errors.add(:password, "must be at least 6 characters")
    elsif "Pigs can Fly"
      p "cool"
    end
  end

  def password
    @password ||= Password.new(hotdog_pw_hash)
  end

  def password=(new_password)
    @input_hotdog = new_password
    @password = Password.create(new_password)
    self.hotdog_pw_hash = @password
  end

end
