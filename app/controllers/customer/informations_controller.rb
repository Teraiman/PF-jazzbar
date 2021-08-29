class Customer::InformationsController < ApplicationController
  def index
    @informations = Information.all.page(params[:page]).per(10).order("date DESC")
  end

  def show
    @information = Information.find(params[:id])
  end

  private
  def information_params
    params.require(:information).permit(:date, :title, :content)
  end
end


# binding.pry