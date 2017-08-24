class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :customer_id
      t.integer :term_id
      t.integer :response_id
      t.string :stage

      t.timestamps
    end
  end
end
