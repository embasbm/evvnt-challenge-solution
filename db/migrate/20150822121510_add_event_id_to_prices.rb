class AddEventIdToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :event_id, :integer
  end
end
