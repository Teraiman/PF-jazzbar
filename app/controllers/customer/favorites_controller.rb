class Customer::FavoritesController < ApplicationController
  before_action :set_artist
  before_action :authenticate_customer!   # ログイン中のカスタマのみに許可（未ログインなら、ログイン画面へ移動）

  def index
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:artist_id)  # ログイン中のカスタマのお気に入りのartist_idカラムを取得
    @favorite_list = Artist.find(favorites)     # artistsテーブルから、お気に入り登録済みのレコードを取得
  end

  # お気に入り登録
  def create
    # if @artist.customer_id != current_customer.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(customer_id: current_customer.id, artist_id: @artist.id)
    # end
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, artist_id: @artist.id)
    @favorite.destroy
  end

  private
  def set_artist
    unless params[:artist_id].nil?
      @artist = Artist.find(params[:artist_id])
    end
  end
end