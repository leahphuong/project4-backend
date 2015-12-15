class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :country
      t.string :city
      t.string :est_cost
      t.string :trip_length
      t.string :description
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
