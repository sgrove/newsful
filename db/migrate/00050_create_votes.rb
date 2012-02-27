class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voter,   :polymorphic => true
      t.references :votable, :polymorphic => true
      t.boolean    :positive

      t.timestamps
    end
  end
end
