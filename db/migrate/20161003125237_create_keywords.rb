class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.integer :content_id
      t.string :keyword
      t.float :score

      t.timestamps null: false
    end
  end
end
