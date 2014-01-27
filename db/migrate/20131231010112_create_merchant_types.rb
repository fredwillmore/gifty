class CreateMerchantTypes < ActiveRecord::Migration
  def self.up
    create_table :merchant_types do |t|
      t.string :name
      t.string :key
      t.string :icon_key
      t.timestamps
    end
    add_column :merchants, :merchant_type_ids, :integer, array: true
  end

  def self.down
    drop_table :merchant_types
    drop_column :merchants, :merchant_type_ids
  end
end
