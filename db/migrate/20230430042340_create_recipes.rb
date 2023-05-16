class CreateRecipes < ActiveRecord::Migration[6.1]

  def change
    create_table :recipes do |t|
      t.integer :genre_id
      t.string :name, null: false
      t.text :introduction
      t.integer :number_of_people
      t.text :how_to_make
      t.boolean :post_status
      t.integer :user_id
      t.timestamps

    end
  end
end
