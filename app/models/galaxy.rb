class Galaxy < ActiveRecord::Base
  has_many :planets
  validates :name,  :uniqueness => true,  :presence => true
end
