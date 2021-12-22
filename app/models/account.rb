class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  validates :first_name, :last_name, :username, :email, presence: true

  scope :alpha, -> { (order(:first_name)) }
end
