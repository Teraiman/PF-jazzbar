class Customer::ArtistsController < ApplicationController

  def index
    @artists = Artist.all.page(params[:page]).per(10).order("name ASC")
    @artist = Artist.new
  end

private
  def artist_params
    params.require(:artist).permit(:name, :part_id)
  end
end
