class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def index_list
  end

  def show
  end

  def edit
  end

  def new
    @schedule = Schedule.new
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def schedule_params
    params.require(:schedule).permit(:title, :date, :time, :charge,)
  end
  
end
