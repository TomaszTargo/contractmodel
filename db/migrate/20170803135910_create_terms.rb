class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :name
      t.integer :weight
      t.text :description
      t.integer :model_id

      t.timestamps
    end
  end
end
