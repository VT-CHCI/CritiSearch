class CreateReflections < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      t.belongs_to :search_item
      t.text :reflection

      t.timestamps
    end
    add_index :reflections, :search_item_id
  end
end
