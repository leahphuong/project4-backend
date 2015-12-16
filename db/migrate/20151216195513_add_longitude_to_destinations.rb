class AddLongitudeToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :longitude, :float
  end
end
