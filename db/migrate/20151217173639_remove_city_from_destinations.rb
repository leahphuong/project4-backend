class RemoveCityFromDestinations < ActiveRecord::Migration
  def change
    remove_column :destinations, :city, :string
  end
end
