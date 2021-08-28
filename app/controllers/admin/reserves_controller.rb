class Admin::ReservesController < ApplicationController

  def show
    @reserve = Reserve.find(params[:id])
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @reserve = Reserve.find(params[:id])
  end

  def new
    @reserve = Reserve.new
    @reserve.schedule_id = params[:format]
  end

  def create
    @reserve = Reserve.new(reserve_params)
    @reserve.admin_id = current_admin.id
    
    # byebug
    if @reserve.save!
      flash[:alert] = "作成しました"
      redirect_to admin_reserve_path(@reserve.id)
    else
      flash[:alert] = "作成できませんでした"
      render action: :new
    end
  end

  def update
    @reserve = Reserve.find(params[:id])
    if @reserve.update(reserve_params)
      flash[:alert] = "更新しました"
      redirect_to admin_reserve_path(@reserve.id)
    else
      flash[:alert] = "更新できませんでした"
      render action: :edit
    end
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    flash[:alert] = "削除しました"
    redirect_to admin_reserve_path(@reserve.id)
  end

  private
  def reserve_params
    params.require(:reserve).permit(:name, :count, :customer_id, :schedule_id)
  end
end
