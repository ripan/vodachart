class Stage < ActiveRecord::Base
  validates :name,  :uniqueness => true,  :presence => true
end
