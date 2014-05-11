class Planet < ActiveRecord::Base
  belongs_to :galaxy
  has_many :aliens
  validates :name,  :presence => true
end
