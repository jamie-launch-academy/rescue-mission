class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :message, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
