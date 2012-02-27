class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      t.bushido_authenticatable
      t.trackable

      t.string  :email
      t.string  :ido_id
      t.string  :first_name
      t.string  :last_name
      t.text    :about
      t.string  :locale
      t.string  :timezone
      t.integer :points

      t.timestamps
    end

    add_index :admins, :email,  :unique => true
    add_index :admins, :ido_id, :unique => true
    # add_index :admins, :confirmation_token,   :unique => true
    # add_index :admins, :unlock_token,         :unique => true
    # add_index :admins, :authentication_token, :unique => true
  end

end
