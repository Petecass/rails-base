# frozen_string_literal: true
class Identity < ApplicationRecord
  belongs_to :user, optional: true

  validates :uid, :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
