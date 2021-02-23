class Account < ApplicationRecord
    has_many :transactions 
    validates :name, :balance, presence: true

    def update_balance
        if transaction.kind == 'deposit'
            self.balance += transaction.amount
            self.save
        elsif transaction.kind == 'withdraw'
            if self.balance >= transaction.amount
                self.balance -= transaction.amount
                self.save
            else
                return 'Balance is too low.'
            end
        end
    end
end
