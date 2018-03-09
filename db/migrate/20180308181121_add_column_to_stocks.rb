class AddColumnToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :amount, :integer
    add_column :stocks, :start_date, :date
    add_column :stocks, :end_date, :date
    add_column :stocks, :symbol, :string
  end
end
