class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.timestamps
      t.string :key
      t.string :name
    end
  end
end
