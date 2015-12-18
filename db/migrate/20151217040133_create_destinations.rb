class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :country
      t.string :city
      t.string :trip_length
      t.string :est_cost
      t.string :start_date
      t.string :end_date
      t.text :description
      t.float :longitude
      t.float :latitude
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
