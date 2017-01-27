# frozen_string_literal: true
class User < ApplicationRecord
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Associations
  has_many :identities

  # Validations
  validates :email, format: { without: TEMP_EMAIL_REGEX, on: :update }

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  # Class Methods

  class << self
    def find_for_oauth(auth, signed_in_resource = nil)
      # Get the identity and user if they exist
      identity = Identity.find_for_oauth(auth)

      # If a signed_in_resource is provided it always overrides the existing user
      # to prevent the identity being locked with accidentally created accounts.
      user = signed_in_resource ? signed_in_resource : identity.user

      # Create the user if needed
      user = find_or_create_by_email(auth) if user.nil?

      associate_identity(identity, user)
      user
    end

    def find_or_create_by_email(auth)
      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email = auth_email(auth)

      user = User.find_or_initialize_by(email: email) do |u|
        u.name = auth.extra.raw_info.name
        u.password = Devise.friendly_token[0, 20]
      end

      user.skip_confirmation! if user.respond_to?(:skip_confirmation)
      user.save!

      user
    end

    private

    def associate_identity(identity, user)
      return unless identity.user != user
      identity.user = user
      identity.save!
    end

    def auth_email(auth)
      # email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      # email = auth.info.email # if email_is_verified
      if auth.info.email.present?
        auth.info.email
      else
        "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com"
      end
    end
  end
end
