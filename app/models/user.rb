class User < ApplicationRecord
  has_one :speaker
  delegate :proposals, to: :speaker

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP }

  passwordless_with :email
end
