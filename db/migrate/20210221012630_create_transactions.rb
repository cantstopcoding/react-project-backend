class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.float :amount
      t.string :kind
      t.datetime :date
      t.string :description

      t.timestamps
    end
  end
end
