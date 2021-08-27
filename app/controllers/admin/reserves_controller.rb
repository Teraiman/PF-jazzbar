class Admin::ReservesController < ApplicationController

  def show
    @reserve = Reserve.find(params[:id])
    @schedule = Schedule.find(params[:id])
  end

  def edit
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
    params.require(:reserve).permit(:count, :customer_id, :schedule_id)
  end
end
