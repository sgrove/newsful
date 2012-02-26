class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer  :voter,   :polymorphic => true
      t.integer  :votable, :polymorphic => true
      t.string   :direction

      t.timestamps
    end
  end
end
