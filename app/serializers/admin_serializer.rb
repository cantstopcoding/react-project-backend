class AdminSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :image_url
  has_many :items
end
