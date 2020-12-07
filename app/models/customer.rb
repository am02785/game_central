class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Each customer owns one basket.
  # The basket which the customer owns should be destroyed if the customer is removed.
  has_one :basket, dependent: :destroy
end
