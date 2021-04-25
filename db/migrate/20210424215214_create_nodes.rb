class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :kind
      t.string :ipaddress
      t.string :hostname
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
