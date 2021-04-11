class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :description, :price, :admin_id
end
