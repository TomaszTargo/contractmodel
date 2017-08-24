class CreateJoinTableCustomerModel < ActiveRecord::Migration[5.0]
  def change
    create_join_table :customers, :models do |t|
      t.index [:customer_id, :model_id]
      t.index [:model_id, :customer_id]
    end
  end
end
