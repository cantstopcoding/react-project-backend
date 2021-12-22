class AccountSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :image_url
  has_many :items
end
