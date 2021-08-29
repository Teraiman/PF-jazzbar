class Customer::ReservesController < ApplicationController
  def new
    @reserve = Reserve.new
    @reserve.schedule_id = params[:format]
    # Scheduleからキャパシティの最大値を取得
    # Reserveから今までの予約人数を取得。
    # Scheduleの最大値 - Reserveの予約人数 = 予約できる最大人数
  end

  def finish
  end

  def index
    schedules = Schedule.where("date >= ?", Time.current.to_date)
    # schedules == Schedule.where("date >= ?", Time.current.to_date) # 一緒
    # schedules # => [ {id: 1, title... }, { id: 2...} ]
    # schedules.pluck # => [1, 2 ...]
    # @reserves = Reserve.where(customer_id: current_customer, schedule_id: [1, 2])
    # byebug
    @reserves = Reserve.where(customer_id: current_customer, schedule_id: schedules.pluck(:id))


    # Schedule.where(id: [1, 2, 3])
    # Reserve.where(customer_id: 5, schedule_id: [5])

    # @reserves.all.order("schedule_id.date DESC")

  end

  def show
    @reserve = Reserve.find(params[:id])
  end

  def create
    @reserve = Reserve.new(reserve_params)
    @reserve.customer_id = current_customer.id
    # @reserve.schedule_id = params[:format]    # if 予約人数(params[:count]) + Reserve予約済み人数 <= Scheduleのキャパシティ
    #   保存できる。
    # else
    #   予約失敗。満席です。もしくは人数を減らせばできるかも。
    # end
    if @reserve.save
      flash[:alert] = "予約しました"
    else
      # byebug
      flash[:alert] = "このライブはすでに予約済みです"
    end
    redirect_to reserves_finish_path
  end

  def update
    @reserve = Reserve.find(params[:id])
    if @reserve.update(reserve_params)
      flash[:alert] = "更新しました"
      redirect_to reserves_path
    else
      flash[:alert] = "更新できませんでした"
      render action: :show
    end
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    flash[:alert] = "削除しました"
    redirect_to reserves_path
  end

  private
  def reserve_params
    params.require(:reserve).permit(:count, :schedule_id)
  end
end
