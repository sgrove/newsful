class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :author, :polymorphic => true
      t.references :post
      t.integer    :parent_id
      t.text       :body
      t.integer    :points

      t.timestamps
    end
  end
end
