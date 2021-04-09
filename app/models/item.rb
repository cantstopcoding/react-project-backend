class Item < ApplicationRecord
  belongs_to :account
  validates :name, :image_url, :description, :price, presence: true
  # validates_inclusion_of :kind, :in => ["deposit", "withdraw"]
end
