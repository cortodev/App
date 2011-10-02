class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.text :contenu

      t.timestamps
    end
  end
end
