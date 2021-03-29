class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :item 
  validates :amount, presence: true
  validates_inclusion_of :kind, :in => ["deposit", "withdraw"]
end
