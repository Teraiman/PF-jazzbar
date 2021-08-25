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
    @reserves.all.order("schedule_id.date DESC")
  end

  def show
  end

  def create
    @reserve = current_customer.reserves.create(reserve_params)
    # if 予約人数(params[:count]) + Reserve予約済み人数 <= Scheduleのキャパシティ
    #   保存できる。
    # else
    #   予約失敗。満席です。もしくは人数を減らせばできるかも。
    # end
    if @reserve.save
      flash[:alert] = "予約しました"
    else
      flash[:alert] = "このライブはすでに予約済みです"
    end
    redirect_to reserves_finish_path
  end

  def update
  end

  def destroy
  end

  private
  def reserve_params
    params.require(:reserve).permit(:count, :customer_id, :schedule_id)
  end
end
