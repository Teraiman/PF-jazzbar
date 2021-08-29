class Admin::ReservesController < ApplicationController

  def index
    @schedule = Schedule.find(params[:schedule_id])
    @reserves = @schedule.reserves
  end

  def show
    @reserve = Reserve.find(params[:id])
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @reserve = Reserve.find(params[:id])
  end

  def new

    @schedule = Schedule.find(params[:schedule_id])
    @reserve = Reserve.new
    # @reserves = @schedule.reserves.includes(:customer)
  end

  def create
     @schedule =Schedule.find(params[:schedule_id])
    @reserve = Reserve.new(reserve_params)
    @reserve.admin_id = current_admin.id

    # binding.pry

    if @reserve.save!
      flash[:alert] = "作成しました"
      redirect_to admin_schedule_reserves_path(@schedule)
    else
      flash[:alert] = "作成できませんでした"
      render action: :new
    end
  end

  def update
    @reserve = Reserve.find(params[:id])
    if @reserve.update(reserve_params)
      flash[:alert] = "更新しました"
      redirect_to admin_schedule_reserves_path(@reserve.id)
    else
      flash[:alert] = "更新できませんでした"
      render action: :edit
    end
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    flash[:alert] = "削除しました"
    redirect_to admin_schedule_reserves_path(@reserve.id)
  end

  private
  def reserve_params
    params.require(:reserve).permit(:name, :count, :customer_id).merge(schedule_id: params[:schedule_id])
  end
end
