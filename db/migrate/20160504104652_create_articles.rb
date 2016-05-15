class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :description, :author
      t.float :price

      t.timestamps null: false
    end
  end
end
