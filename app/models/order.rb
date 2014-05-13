class Order < ActiveRecord::Base
	belongs_to :alien
	belongs_to :product
	belongs_to :stage
end
