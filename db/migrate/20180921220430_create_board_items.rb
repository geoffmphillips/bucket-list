class CreateBoardItems < ActiveRecord::Migration[5.2]
  def change
    create_table :board_items do |t|
      t.references :post, foreign_key: true
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
