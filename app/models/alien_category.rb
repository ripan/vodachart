class AlienCategory < ActiveRecord::Base
  has_many :aliens
  validates :name,  :uniqueness => true,  :presence => true
end
