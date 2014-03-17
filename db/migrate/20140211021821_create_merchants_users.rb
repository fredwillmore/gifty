class CreateMerchantsUsers < ActiveRecord::Migration
  def change
    create_table :merchants_users do |t|
      t.belongs_to :merchant
      t.belongs_to :user
    end
  end
end
