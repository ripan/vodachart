class CreateAliens < ActiveRecord::Migration
  def change
    create_table :aliens do |t|
      t.string :name
      t.integer :alien_category_id
      t.integer :planet_id

      t.timestamps
    end
  end
end
