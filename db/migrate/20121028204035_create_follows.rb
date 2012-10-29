class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :search_item
      t.string :url

      t.timestamps
    end
    add_index :follows, :search_item_id
  end
end
