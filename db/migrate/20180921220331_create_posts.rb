class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :note
      t.string :location
      t.string :city
      t.string :photo_url
      t.string :title
      t.string :categories
      t.integer :lat
      t.integer :long
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
