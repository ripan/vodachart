class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :alien_id
      t.integer :product_id
      t.integer :stage_id
      t.datetime :closed_at
      t.boolean :is_closed
      t.decimal :setup_charge
      t.decimal :monthly_revenue

      t.timestamps
    end
  end
end
