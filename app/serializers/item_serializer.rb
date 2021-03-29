class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :price, :description

  has_many :transactions
end
