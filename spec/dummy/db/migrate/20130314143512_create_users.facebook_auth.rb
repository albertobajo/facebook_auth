# This migration comes from facebook_auth (originally 20130306190029)
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_uid
      t.string :facebook_attrs

      t.timestamps
    end
    add_index :users, :facebook_uid, :unique => true
  end
end
