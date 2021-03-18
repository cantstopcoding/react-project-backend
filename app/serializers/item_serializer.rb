class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :price, :description
end
