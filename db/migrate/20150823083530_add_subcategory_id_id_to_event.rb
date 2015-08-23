class AddSubcategoryIdIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :sub_category_id, :integer
  end
end
