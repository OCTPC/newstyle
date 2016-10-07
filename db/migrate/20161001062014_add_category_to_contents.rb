class AddCategoryToContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :content
      t.string :category
      t.string :string

      t.timestamps null: false
    end
  end
end
