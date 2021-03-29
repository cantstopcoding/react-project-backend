class Account < ApplicationRecord
    has_many :transactions 
    has_many :items, through: :transactions 
    validates :name, :balance, presence: true

    def update_balance(transaction)
        if transaction.kind == 'deposit'
            self.balance += transaction.amount
            self.save
        elsif transaction.kind == 'withdraw'
            if self.balance >= transaction.amount
                self.balance -= transaction.amount
                self.save
            else
                return 'Balance too low.'
            end
        end
    end

    def update_balance_on_delete(transaction)
        if transaction.kind == 'deposit'
            if self.balance >= transaction.amount
                self.balance -= transaction.amount
                self.save
            else
                return 'Balance is too low.'
            end
        elsif transaction.kind == 'withdraw'
            self.balance += transaction.amount
            self.save
        end
    end
end
