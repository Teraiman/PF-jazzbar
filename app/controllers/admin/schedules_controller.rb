class Admin::SchedulesController < ApplicationController
  include Kaminari::Helpers::UrlHelper

  def index
    @schedules = Schedule.all
  end

  def index_list
    from = Date.today.beginning_of_month    # 今日を含む月の初日
    to = Date.today.next_month.beginning_of_month    # 今日を含む月の、次の月の初日
    @schedules = Schedule.all.order(date: :ASC).where(date: from...to)
    # byebug
  end

  def show
    @schedule = Schedule.find(params[:id])
    if customer_signed_in?
      @reserve = Reserve.find_by(schedule_id: @schedule.id, customer_id: current_customer.id)
    elsif admin_signed_in?
      @reserve = Reserve.find_by(schedule_id: @schedule.id, admin_id: current_admin.id)
    else
      flash[:alert] = "予約する場合はログインしてください。"
      redirect_to new_customer_session_path
    end
  end


  def edit
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
    @schedule.artists.build
    @time = "OPEN：18:00~ / START：19:00~"
    @charge = "前売3,000円 / 当日3,500円"
  end

  def member
    @schedule = Schedule.find(params[:id])
  end

  def member_create
    @schedule = Schedule.find(params[:id])
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:alert] = "アーティストを追加しました"
    else
      flash[:alert] = "このアーティストはすでに追加済みです"
    end
    @schedule.relationships.create(artist_id: @artist.id)
    redirect_to admin_member_path(@schedule)
  end

  def member_select
    @schedule = Schedule.find(params[:id])
    @schedule.relationships.create(schedule_member_select_params)
    redirect_to admin_member_path(@schedule)
  end

  def create
    @schedule = Schedule.new(schedule_params)
    artist = Artist.find_or_create_by(name: params[:artist_name])
    if @schedule.save
      Relationship.create(artist_id: artist.id, schedule_id: @schedule.id)
      redirect_to admin_member_path(@schedule)
    else
      render "new"
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to admin_member_path(@schedule)
    else
      flash[:alert] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:alert] = "削除しました"
    redirect_to admin_schedules_path
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
