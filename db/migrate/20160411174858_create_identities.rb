class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string  :provider
      t.string  :uid
      t.string  :access_token
      t.string  :refresh_token
      t.integer :expires_at
      t.integer :user_id

      t.timestamps
    end
  end
end
