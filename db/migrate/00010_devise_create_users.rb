class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.bushido_authenticatable
      t.database_authenticatable
      t.recoverable
      t.rememberable
      t.trackable

      t.string  :email
      t.string  :username
      t.string  :ido_id
      t.string  :first_name
      t.string  :last_name
      t.text    :about
      t.string  :locale
      t.string  :timezone
      t.integer :points
      
      t.timestamps
    end

    add_index :users, :email,  :unique => true
    add_index :users, :ido_id, :unique => true
  end

end
