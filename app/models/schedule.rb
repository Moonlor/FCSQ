class Schedule < ApplicationRecord
  belongs_to :user
  has_many :via_city_names, dependent: :destroy
  validates :user_id, :depart_city, :final_city, presence: true
  validates :via_city_number, :depart_date, :final_date, presence: true

  default_scope -> { order('created_at DESC') }

  def status_in_words
  	if self.status == 0
  	  return "Calculating"
  	else
  	  return "Finished"
  	end
  end 

end
