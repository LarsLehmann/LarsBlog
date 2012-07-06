class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :location
      t.datetime :showdate
      t.text :support
      t.decimal :eintritt

      t.timestamps
    end
  end
end
