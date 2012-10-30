class AddResultContentToRating < ActiveRecord::Migration
  def self.up
    change_table :ratings do |t|
      t.text :result_content
    end
  end

  def down
    t.remove :result_content
  end
end
