class User < ApplicationRecord
  has_one :trainer

  # UID must be present and must be unique for a given provider
  validates :uid, presence: true, uniqueness: { scope: :provider }

  # We only support GitHub-based logins right now
  validates :provider, presence: true, inclusion: { in: ["github"] }

  def self.find_or_create_by_github(auth_hash)
    return self.find_or_create_by(
      uid: auth_hash[:uid],
      provider: auth_hash[:provider]
    )
  end
end
