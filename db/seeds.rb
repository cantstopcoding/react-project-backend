# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.destroy_all
Item.destroy_all

caroline = Account.create(first_name: "Caroline", last_name: "D'ambrosio", username: "bestdesigner", email: "caroline@caroline.com", image_url: "https://i.pinimg.com/originals/77/97/06/7797069f1945e196a01158932146810e.jpg")
coco = Account.create(first_name: "Coco", last_name: "Chanel", username: "chanel", email: "chanel@chanel.com", image_url: "https://cdn.asiatatler.com/asiatatler/i/th/2020/07/24110448-travel9_cover_1000x1500.jpg")
dior = Account.create(first_name: "Christian", last_name: "Dior", username: "dior", email: "dior@dior.com", image_url: "https://www.dior.com/couture/var/dior/storage/images/horizon/horizon-import/dior-et-le-chateau-de-la-colle-noire/block-list-christian-dior-et-la-provence-terre-d’inspiration/block-image2/14526753-4-eng-US/image_1440_1200.jpg")

outlander_dress = Item.create(account_id: caroline.id, name: "Outlander Costume", image_url: "https://yt3.ggpht.com/a/AATXAJx5mEunDOUJudzpBNqD61pppw8kcQvgmDHMosko=s100-c-k-c0xffffffff-no-rj-mo", price: 500.00, description: "It's awesome!")
expensive_purse = Item.create(account_id: coco.id, name: "Expensive Purse", image_url: "https://cdn.shopify.com/s/files/1/0384/0161/products/56265-92_20Chanel_20Vintage_20Classic_20Double_20Flap_20Bag_20Qu_2D_0002_518x518.jpg?v=1591021463", price: 100000.00, description: "It's awesome!")
expensive_sandals = Item.create(account_id: dior.id, name: "Expensive Sandals", image_url: "https://www.mybudapester.com/media/catalog/product/cache/2/image/900x900/9df78eab33525d08d6e5fb8d27136e95/i/m/image_3681_1_5394.jpg", price: 5000000000000.54, description: "It's too much damn money")
