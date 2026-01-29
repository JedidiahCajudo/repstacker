class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true

  generates_token_for :email_confirmation, expires_in: 2.days do
    unconfirmed_email
  end

  def confirm_email
    update(email_address, unconfirmed_email:, unconfirmed_email: nil)
  end
  
  validates :password, length: { minimum: 4 }, allow_nil: true
end
