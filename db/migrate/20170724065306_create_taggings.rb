class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :mood, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
