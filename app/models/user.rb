class User < ApplicationRecord
  # UID must be present and must be unique for a given provider
  validates :uid, presence: true, uniqueness: { scope: :provider }

  # We only support GitHub-based logins right now
  validates :provider, presence: true, inclusion: { in: ["github"] }
end
