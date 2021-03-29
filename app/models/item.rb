class Item < ApplicationRecord
    has_many :transactions 
    has_many :accounts, through: :transactions
end


#   class Physician < ApplicationRecord
#     has_many :appointments
#     has_many :patients, through: :appointments
#   end
  
#   class Appointment < ApplicationRecord
#     belongs_to :physician
#     belongs_to :patient
#   end
  
#   class Patient < ApplicationRecord
#     has_many :appointments
#     has_many :physicians, through: :appointments
#   end