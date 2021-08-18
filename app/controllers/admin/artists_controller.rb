class Admin::ArtistsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @artists = Artist.all.page(params[:page]).per(10)
    @part = Part.find_by(code: paprams[:part_id]).id
  end
  
  def show
  end
  
  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end
  
  def create
    @artist = Artist.new(artist_params)
    @artist.save

  end
  
  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      flash[:alert] = "更新しました"
      redirect_to admin_artists_path
    else
      flash[:alert] = "更新できませんでした"
      render action: :edit
    end
  end
  
  def destroy
    @artist = Artist.find(params[:id])
    @artist.delete
    flash[:alert] = "削除しました"
    redirect_to admin_artists_path
  end
  
    private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
