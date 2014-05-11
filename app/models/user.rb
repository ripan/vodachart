class User < ActiveRecord::Base

  validates :email,  :uniqueness => true

  belongs_to :identity, :foreign_key => 'uid', :dependent => :destroy
  has_and_belongs_to_many :roles

  def self.from_omniauth(auth, user_info)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.roles << Role.find(user_info[:role_id]) if user.roles.blank?
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"]) unless auth["credentials"]["expires_at"].blank?
      user.save!
    end
  end

  def role
    self.roles.pluck(:name).join(', ')
  end

end
