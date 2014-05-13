class Order < ActiveRecord::Base
	belongs_to :alien
	belongs_to :product
	belongs_to :stage

  def is_closed
    self.read_attribute(:is_closed) ? 'Yes' : 'No'
  end
  
end
