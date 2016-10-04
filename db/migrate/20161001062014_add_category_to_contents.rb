class AddCategoryToContents < ActiveRecord::Migration
  def change
    add_column :content, :category, :string
  end
end
