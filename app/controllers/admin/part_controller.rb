class Admin::PartController < ApplicationController
  def index
    @part = Part.new
    @parts = Part.all.order("part_name ASC") #アルファベット降順
  end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    @part.update(part_params)
    flash[:alert] = "変更しました"
    redirect_to admin_part_index_path
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      flash[:alert] = "パートを追加しました"
    else
      flash[:alert] = "このパートはすでに追加済みです"
    end
    redirect_to admin_part_index_path
  end

  private
  def part_params
    params.require(:part).permit(:part_name)
  end

end
