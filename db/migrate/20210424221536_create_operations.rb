class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.integer :operation_type, defalut: 0
      t.references :user, foreign_key: true
      t.references :node, foreign_key: true

      t.timestamps
    end
  end
end
