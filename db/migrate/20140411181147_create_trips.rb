class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :user
      t.datetime :starts_on
      t.datetime :ends_on
      t.string :name
      t.string :location

      t.timestamps
    end
    add_index :trips, :user_id
  end
end
