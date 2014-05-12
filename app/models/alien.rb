class Alien < ActiveRecord::Base
  belongs_to :planet
  belongs_to :alien_category
  validates :name, :presence => true, :uniqueness => {:scope => [:alien_category_id]}
end
