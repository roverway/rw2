class AddCategoryIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :category_id, :ingeger
  end

  def self.down
    remove_column :posts, :category_id
  end
end
