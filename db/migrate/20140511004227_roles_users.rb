class RolesUsers < ActiveRecord::Migration
  def change
     create_table :roles_users do |t|
      t.integer :user_id, :role_id
      t.timestamps
    end
  end
end
