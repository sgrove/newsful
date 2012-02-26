class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :poster, :polymorphic => true
      t.string     :title
      t.string     :url
      t.text       :body       # Optional body for local-posts
      t.integer    :points

      t.timestamps
    end
  end
end
