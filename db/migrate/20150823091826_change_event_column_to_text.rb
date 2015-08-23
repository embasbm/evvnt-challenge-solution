class ChangeEventColumnToText < ActiveRecord::Migration
  def up
    change_column :events, :artists,  :text
    change_column :events, :summary,  :text
    change_column :events, :title,  :text
    change_column :events, :organiser_name,  :text
    change_column :events, :package,  :text
  end

  def down
    change_column :events, :artists,  :string
    change_column :events, :summary,  :string
    change_column :events, :title,  :string
    change_column :events, :organiser_name,  :string
    change_column :events, :package,  :string
  end
end
