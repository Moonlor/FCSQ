class Schedule < ApplicationRecord
  belongs_to :user
  has_many :via_city_names, dependent: :destroy
  validates :user_id, :depart_city, :final_city, presence: true
  validates :via_city_number, :depart_date, :final_date, presence: true

  validate :check_date
  def check_date
    self.errors[:date] << "Depart_date must be earlier than final_date." if depart_date.present? && final_date.present? && depart_date > final_date
  end

  validate :check_now
  def check_now
    self.errors[:date] << "Depart_date must be later than today." if  depart_date.present? && depart_date < Time.now
  end

  default_scope -> { order('created_at DESC') }

  def status_in_words
  	if self.status == 0
  	  return "Calculating"
  	else
  	  return "Finished"
  	end
  end 

end
