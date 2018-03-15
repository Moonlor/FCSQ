class SchedulesController < ApplicationController
  before_action :signed_in_user , only: [:index, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@schedule = current_user.schedules.build(schedule_params)
  	@schedule.user_id = current_user.id
  	@schedule.status = 0
  	if @schedule.save
  	  flash[:success] = "Well done, Next step!"
  	  params[:via_city_name][:names].each do |name|
  	  	@via_city = @schedule.via_city_names.build
  	  	@via_city.user_id = current_user.id
  	  	@via_city.city_name = name
  	  	@via_city.schedule_id = @schedule.id
  	  	@via_city.save
  	  end
  	  pp params
  	  redirect_to schedules_path
  	else
      @feed_items = current_user.feed.paginate(page: params[:page])
      @micropost = current_user.microposts.build
  	  render 'static_pages/home'
  	end
  end

  def index
  	@schedule_items = current_user.schedules.paginate(page: params[:page])
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end




  private

    def schedule_params
  	  params.require(:schedule).permit(:depart_city, :final_city, :via_city_number, 
  		                         :password_confirmation, :depart_date, :final_date)
    end

    def correct_user
      @schedule = current_user.schedules.find_by(id: params[:id])
      redirect_to schedules if @schedule.nil?
    end
  
end