class AddGoogleIdColumnToLocations < ActiveRecord::Migration[5.2]
  def change
    change_table :locations do |t|
      t.string :google_id
    end
  end
end
