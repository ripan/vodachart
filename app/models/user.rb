class User < ActiveRecord::Base

  validates :email,  :uniqueness => true,  :presence => true
  validates :provider,  :presence => true

  belongs_to :identity, :dependent => :destroy
  has_and_belongs_to_many :roles

  def self.from_omniauth(auth, user_info)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.roles << Role.find_by(:name => user_info[:role]) if user.roles.blank?
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"]) unless auth["credentials"]["expires_at"].blank?
      user.save!
    end
  end

  def role
    self.roles.pluck(:name).join(', ')
  end

  def is?(requested_role)
    self.roles.include? Role.find_by_name(requested_role)
  end

  def has_role? role
    self.roles.include? role
  end

end
