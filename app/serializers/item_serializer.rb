class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :description, :price, :account_id
end
