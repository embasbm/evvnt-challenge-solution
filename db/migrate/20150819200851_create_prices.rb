class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :criteria
      t.string :value

      t.timestamps
    end
  end
end
