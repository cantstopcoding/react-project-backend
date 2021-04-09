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

# outlander_dress  = Item.create(name: "Outlander Costume", image_url: "https://yt3.ggpht.com/a/AATXAJx5mEunDOUJudzpBNqD61pppw8kcQvgmDHMosko=s100-c-k-c0xffffffff-no-rj-mo", price: 500.00, description:"It's awesome!")
