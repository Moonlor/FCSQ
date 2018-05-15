class Order < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :amount,  presence: true
end
