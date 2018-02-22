class ViaCityName < ApplicationRecord
  belongs_to :schedule
  validates :user_id, :city_name, :schedule_id, presence: true
end
