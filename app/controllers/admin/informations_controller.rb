class Admin::InformationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @informations = Information.all.page(params[:page]).per(10)
  end

  def show
    @information = Information.find(params[:id])
  end

  def new
    @information = Information.new
  end

  def edit
    @information = Information.find(params[:id])
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      flash[:alert] = "作成しました"
      redirect_to admin_information_path(@information.id)
    else
      flash[:alert] = "作成できませんでした"
      render action: :new
    end
  end

  private
  def information_params
    params.require(:information).permit(:date, :title, :content)
  end
end


# binding.pry