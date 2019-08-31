class CreateOpeningHours < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_hours do |t|
      t.references :shop, foreign_key: true
      t.integer :day
      t.time :opens
      t.time :closes
      t.datetime :valid_from
      t.datetime :valid_through

      t.timestamps
    end
  end
end
