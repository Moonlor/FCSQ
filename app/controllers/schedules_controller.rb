
class SchedulesController < ApplicationController
  before_action :signed_in_user , only: [:index, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@schedule = current_user.schedules.build(schedule_params)
  	@schedule.user_id = current_user.id
  	@schedule.status = 0
    @schedule.isstop = (params[:isstop].nil?) ? '0':params[:isstop]
    @schedule.flight_day = (params[:flight_day].nil?) ? '0':params[:flight_day]
    if @schedule.save
      flash[:success] = "[ok]Well done, schedule being calculating!"
      if params.include?(:via_city_name)
        params[:via_city_name][:names].each do |name|
          @via_city = @schedule.via_city_names.build
          @via_city.user_id = current_user.id
          @via_city.city_name = name
          @via_city.schedule_id = @schedule.id
          @via_city.save
        end
      end

      pp '======================='
      pp params
      pp '======================='

      s = Schedule.find_by(id: @schedule.id)
      cities = s.via_city_names
      a = []
      for each in cities
        a.append each
      end
      j = JSON.parse(s.to_json)
      j['cities'] = a
      j_ok = j.to_json

      connection =  Bunny.new(host: '182.254.138.108', user: 'woshinibaba', pass: 'nishiwoerzi')
      connection.start
      channel = connection.create_channel

      queue = channel.queue('query_for_schedule')
      channel.default_exchange.publish(j_ok, routing_key: queue.name)
      connection.close

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
  		                         :password_confirmation, :depart_date, :final_date,
                               :isstop, :flight_day, :ontime_rate, :seat_type, :earliest_dept_time, :latest_arv_time,:hotel_type,
                               :hotel_star, :lowest_price, :highest_price, :hotel_score, :user_recommend, :user_number
                               )
    end

    def correct_user
      @schedule = current_user.schedules.find_by(id: params[:id])
      redirect_to schedules if @schedule.nil?
    end
  
end