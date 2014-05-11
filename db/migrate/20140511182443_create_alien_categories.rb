class CreateAlienCategories < ActiveRecord::Migration
  def change
    create_table :alien_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
