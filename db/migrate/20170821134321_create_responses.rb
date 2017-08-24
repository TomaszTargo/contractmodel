class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.text :response
      t.integer :points
      t.integer :term_id

      t.timestamps
    end
  end
end
