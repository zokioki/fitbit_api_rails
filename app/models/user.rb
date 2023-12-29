class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:fitbit]

  has_many :identities, dependent: :destroy

  def self.from_omniauth(auth)
    identity = Identity.where(provider: auth.provider, uid: auth.uid).first_or_create do |identity|
      if identity.user.nil?
        user = User.new
        user.email = auth.info.email || "#{auth.uid}@example.org"
        user.password = Devise.friendly_token[0, 20]
      end
      identity.user = user
    end

    identity.access_token = auth["credentials"]["token"]
    identity.refresh_token = auth["credentials"]["refresh_token"]
    identity.expires_at = auth["credentials"]["expires_at"]
    identity.save
    identity.user
  end

  def identity_for(provider)
    identities.where(provider: provider).first
  end

  def fitbit_client
    return @fitbit_client if defined?(@fitbit_client)

    fitbit_identity = identity_for("fitbit")

    @fitbit_client = FitbitAPI::Client.new(
      access_token: fitbit_identity.access_token,
      refresh_token: fitbit_identity.refresh_token,
      expires_at: fitbit_identity.expires_at,
      user_id: fitbit_identity.uid,
      on_token_refresh: method(:handle_token_refresh)
    )
  end

  private

  def handle_token_refresh(token)
    identity_for("fitbit").update!(
      access_token: token.token,
      refresh_token: token.refresh_token,
      expires_at: token.expires_at
    )
  end
end
