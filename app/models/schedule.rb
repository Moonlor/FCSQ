class Schedule < ApplicationRecord
  belongs_to :user
  has_many :via_city_names, dependent: :destroy
  validates :user_id, presence: true
  validates :via_city_number, presence: true

  validate :check_depart_city
  def check_depart_city
    self.errors[:depart_city] << "出发城市不能为空" if not depart_city.present?
  end

  validate :check_final_city
  def check_final_city
    self.errors[:final_city] << "到达城市不能为空" if not final_city.present?
  end

  validate :check_depart_date
  def check_depart_date
    self.errors[:depart_date] << "到达时间不能为空" if not depart_date.present?
  end

  validate :check_final_date
  def check_final_date
    self.errors[:final_date] << "到达时间不能为空" if not final_date.present?
  end

  validate :check_date
  def check_date
    self.errors[:date] << "出发时间必须早于返回时间" if depart_date.present? && final_date.present? && depart_date > final_date
  end

  validate :check_now
  def check_now
    self.errors[:date] << "出发时间必须晚于今天" if  depart_date.present? && depart_date < Time.now
  end

  default_scope -> { order('created_at DESC') }

  def status_in_words
  	if self.status == 0
  	  return "计算中"
  	else
  	  return "已完成"
  	end
  end 

end
