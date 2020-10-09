class AddColumnToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :cover, :string
  end
end
