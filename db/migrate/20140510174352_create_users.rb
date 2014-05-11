class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, :uid, :name, :email, :oauth_token
      t.integer :identity_id
      t.datetime :oauth_expires_at
      t.timestamps
    end
  end
end
