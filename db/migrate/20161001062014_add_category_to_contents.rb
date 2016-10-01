class AddCategoryToContents < ActiveRecord::Migration
  def change
    add_column :contents, :category, :string
  end
end
