class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.string :name
      t.string :image_url
      t.string :description
      t.float :price
      t.datetime :date

      t.timestamps
    end
  end
end
