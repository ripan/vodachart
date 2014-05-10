class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :email,:name, :presence => {:message => "Required" }
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :allow_blank => true, :multiline => true 
  validates :email, :uniqueness =>  true
end
