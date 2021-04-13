class Account < ApplicationRecord
    has_many :items 
    validates :first_name, :last_name, :username, :email, presence: true

    # def update_balance(item)
    #     if item.kind == 'deposit'
    #         self.balance += item.amount
    #         self.save
    #     elsif item.kind == 'withdraw'
    #         if self.balance >= item.amount
    #             self.balance -= item.amount
    #             self.save
    #         else
    #             return 'Balance too low.'
    #         end
    #     end
    # end

    # def update_balance_on_delete(item)
    #     if item.kind == 'deposit'
    #         if self.balance >= item.amount
    #             self.balance -= item.amount
    #             self.save
    #         else
    #             return 'Balance is too low.'
    #         end
    #     elsif item.kind == 'withdraw'
    #         self.balance += item.amount
    #         self.save
    #     end
    # end
end
