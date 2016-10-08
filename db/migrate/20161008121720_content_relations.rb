class ContentRelations < ActiveRecord::Migration
  def change
    create_table :contents_relations do |t|
      t.text     :title
      t.text     :url
      t.text     :summary
      t.text     :body
      t.text     :keyword
      t.text     :trend
      t.datetime :time
      t.text     :author
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string   :category
    end
  end
end
