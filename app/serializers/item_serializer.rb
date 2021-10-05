class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :description, :price, :likes, :account_id
end
