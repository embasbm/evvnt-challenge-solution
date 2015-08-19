class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :timestamp
      t.datetime :start_time
      t.timestamp :end_time
      t.timestamp :door_time
      t.timestamp :last_entry_time
      t.string :summary
      t.text :description
      t.string :organiser_name
      t.string :hashtag
      t.string :artists
      t.text :keywords
      t.string :contact
      t.string :package

      t.timestamps
    end
  end
end
