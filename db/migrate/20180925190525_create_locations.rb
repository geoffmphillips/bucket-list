class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :location
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
