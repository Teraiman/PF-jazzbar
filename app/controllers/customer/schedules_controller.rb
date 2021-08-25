class Customer::SchedulesController < ApplicationController
      # binding.pry
  def index
    @schedules = Schedule.all
  end

  def index_list
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :date, :time, :charge, :image, :other)
  end

  def schedule_member_select_params
    params.require(:relationship).permit(:artist_id)
  end

  def artist_params
    params.require(:artist).permit(:name, :part_id)
  end

end
