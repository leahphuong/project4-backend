class AddLatitudeToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :latitude, :float
  end
end
