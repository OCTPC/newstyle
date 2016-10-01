class AddCategory < ActiveRecord::Migration
  def change
    add_colum :titles, :category,:string
  end
end
