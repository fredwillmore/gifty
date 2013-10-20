class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.integer :merchant_id
      t.decimal :amount, 8,2

      t.timestamps
    end
  end
end
