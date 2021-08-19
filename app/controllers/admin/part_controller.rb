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
    if @part.save(uniqueness: false)
      flash[:alert] = "パートを追加しました"
      redirect_to admin_part_index_path
    else
      @part.save(uniqueness: true)
      flash[:alert] = "このパートはすでに追加済みです"
      redirect_to admin_part_index_path
    end
  end

  private
  def part_params
    params.require(:part).permit(:part_name)
  end

end
