class CreateRatingValues < ActiveRecord::Migration
  def change
    create_table :rating_values do |t|
      t.string :name

      t.timestamps
    end
  end
end
