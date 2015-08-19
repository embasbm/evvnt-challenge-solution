class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :town
      t.string :country
      t.string :postcode
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
