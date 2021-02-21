class Account < ApplicationRecord
    validates :name, :balance, presence: true
end
