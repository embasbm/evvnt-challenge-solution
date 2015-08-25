class RenameCriteriaInPrice < ActiveRecord::Migration
  def up
    rename_column :prices, :criteria, :category
  end

  def down
    rename_column :prices, :category, :criteria
  end
end
