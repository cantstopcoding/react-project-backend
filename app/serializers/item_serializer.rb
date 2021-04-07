class ItemSerializer < ActiveModel::Serializer
  attributes :id, :amount, :kind, :date, :description, :account_id
end
