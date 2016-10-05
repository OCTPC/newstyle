class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.text :name
      t.time :time

      t.timestamps null: false
    end
  end
end
