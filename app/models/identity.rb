class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessor :role
  has_one :user, :foreign_key => 'uid'
  
  validates :name,:email,:role, :presence => {:message => "Required" }
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :allow_blank => true, :multiline => true 
  validates :email, :uniqueness =>  true

  after_destroy :destroy_user

  def destroy_user
     self.user.destroy
  end
end
