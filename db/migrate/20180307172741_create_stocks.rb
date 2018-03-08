class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
