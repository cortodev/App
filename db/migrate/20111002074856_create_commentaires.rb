class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.string :nom
      t.string :email
      t.text :contenu
      t.integer :poste_id
      t.boolean :visible

      t.timestamps
    end
  end
end
