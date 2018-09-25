class AddLocationsForeignKeyToPostsTable < ActiveRecord::Migration[5.2]
  def change
    change_table :posts do |t|
      t.remove :lat, :long, :city, :location

      t.references :location
    end
  end
end
