class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :gift_id

      t.timestamps
    end
  end
end
