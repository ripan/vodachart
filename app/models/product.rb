class Product < ActiveRecord::Base
  belongs_to :product_family
  validates :name,  :presence => true, :uniqueness => {:scope => [:product_family_id]}
  has_many :orders
end
