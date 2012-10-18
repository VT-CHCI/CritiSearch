class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :search_item
      t.string :url
      t.belongs_to :rating_value

      t.timestamps
    end
    add_index :ratings, :search_item_id
    add_index :ratings, :rating_value_id
  end
end
