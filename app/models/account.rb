class Account < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :first_name, :last_name, :username, :email, presence: true

  scope :alpha, -> { (order(:first_name)) }
end
