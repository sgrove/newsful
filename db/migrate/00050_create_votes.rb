class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer  :voter,   :polymorphic => true
      t.integer  :votable, :polymorphic => true
      t.boolean  :positive

      t.timestamps
    end
  end
end
