class ChangeDateFormatInTrips < ActiveRecord::Migration
  def change
  	change_column :trips, :starts_on, :date
  	change_column :trips, :ends_on, :date
  end
end
