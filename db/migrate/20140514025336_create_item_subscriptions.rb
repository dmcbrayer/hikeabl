class CreateItemSubscriptions < ActiveRecord::Migration
  def change
    create_table :item_subscriptions do |t|
      t.belongs_to :trip
      t.belongs_to :item

      t.timestamps
    end
  end
end
