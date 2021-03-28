# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.destroy_all
Item.destroy_all
Transaction.destroy_all

checkings_account = Account.create(name: "Checking", balance: 1000)
savings_account = Account.create(name: "Savings", balance: 5000)

outlander_dress  = Item.create(name: "Outlander Costume", image_url: "https://yt3.ggpht.com/a/AATXAJx5mEunDOUJudzpBNqD61pppw8kcQvgmDHMosko=s100-c-k-c0xffffffff-no-rj-mo", price: 500.00, description:"It's awesome!")
expensive_purse = Item.create(name: "Expensive Purse", image_url: "https://cdn.shopify.com/s/files/1/0384/0161/products/56265-92_20Chanel_20Vintage_20Classic_20Double_20Flap_20Bag_20Qu_2D_0002_518x518.jpg?v=1591021463", price: 100000.00, description:"It's awesome!")
# expensive_sandals = Item.create(name: "Expensive Sandals", image_url: "https://www.mybudapester.com/media/catalog/product/cache/2/image/900x900/9df78eab33525d08d6e5fb8d27136e95/i/m/image_3681_1_5394.jpg", price: 5000000000000.54, description: "It's too much damn money", category_id: sandals.id)

transaction = Transaction.create(account_id: checkings_account.id, item_id: outlander_dress.id, amount: 10, kind: "deposit", date: Date.today, description: "Found $10")

transaction_two = Transaction.create(account_id: checkings_account.id, item_id: outlander_dress.id, amount: 10, kind: "withdraw", date: Date.today, description: "Taking $10")

savings_transaction = Transaction.create(account_id: savings_account.id, item_id: expensive_purse.id, amount: 10, kind: "withdraw", date: Date.today, description: "Taking $10")

