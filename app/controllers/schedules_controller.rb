
class SchedulesController < ApplicationController
  before_action :signed_in_user , only: [:index, :create, :destroy]
  before_action :correct_user,   only: :destroy
  skip_before_action :verify_authenticity_token, :only => [:update]

  def create
    @schedule = current_user.schedules.build(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.status = 0
    @schedule.isstop = (params[:isstop].nil?) ? '0':params[:isstop]
    @schedule.flight_day = (params[:flight_day].nil?) ? '0':params[:flight_day]

    all_city = []
    city_check = true

    if params[:via_city_number] != 0 and params.include?(:via_city_name)
      all_city = params[:via_city_name][:names]
    end

    pp all_city, params[:schedule][:depart_city], params[:schedule][:final_city]

    if not params[:schedule][:depart_city].nil? and all_city.include?(params[:schedule][:depart_city])
      flash.now[:error] = "途经城市中不能包含出发城市！"
      city_check = false
    end 

    if not params[:schedule][:final_city].nil? and all_city.include?(params[:schedule][:final_city])
      flash.now[:error] = "途经城市中不能包含到达城市！"
      city_check = false
    end 

    if all_city.length > all_city.uniq.length
      flash.now[:error] = "存在重复的途经城市！"
      city_check = false
    end

    if city_check and @schedule.save
      flash[:success] = "创建成功，行程已开始计算"
      if params.include?(:via_city_name)
        for i in 0..params[:via_city_name][:names].size
          @via_city = @schedule.via_city_names.build
          @via_city.user_id = current_user.id
          @via_city.city_name = params[:via_city_name][:names][i]
          @via_city.schedule_id = @schedule.id
          @via_city.stay_days = params[:via_city_name][:stay_days][i]
          @via_city.save
        end
      end

      pp '============ 从schedule form 获得的表单信息=============='
      pp params
      pp '====================================================='

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

  def update
    pp '---------------------查询订单是否完成----------------------'
    @schedule = Schedule.find_by(id: params[:id])

    connection =  Bunny.new(host: '182.254.138.108', user: 'woshinibaba', pass: 'nishiwoerzi')
    connection.start
    channel = connection.create_channel
    

    queue = channel.queue('result_for_schedule')
    delivery_info, metadata, payload = queue.pop
    connection.close

    if !payload.nil?
      r = JSON.parse(payload)
      @finished_schedule = Schedule.find_by(id: r['schedule_id'])
      if !@finished_schedule.nil?
        @finished_schedule.result = payload
        @finished_schedule.status = 1
        @finished_schedule.save
      end
    end
    @schedule = Schedule.find_by(id: params[:id])

    respond_to do |format|
      format.js
    end
  end




  private

    def schedule_params
      params.require(:schedule).permit(:depart_city, :final_city, :via_city_number, 
                               :password_confirmation, :depart_date, :final_date,
                               :isstop, :flight_day, :ontime_rate, :seat_type, :latest_arv_hour, :latest_arv_minute,
                               :earliest_dept_hour, :earliest_dept_minute,
                               :hotel_type,:hotel_star, :lowest_price, :highest_price, :hotel_score, :user_recommend, :user_number
                               )
    end

    def correct_user
      @schedule = current_user.schedules.find_by(id: params[:id])
      redirect_to schedules if @schedule.nil?
    end
  
end
