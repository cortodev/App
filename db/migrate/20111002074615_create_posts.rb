class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titre
      t.text :contenu
      t.string :image
      t.string :son
      t.integer :user_id
      t.integer :count
      t.string :type

      t.timestamps
    end
  end
end
