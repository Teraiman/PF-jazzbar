class Admin::HomesController < ApplicationController
  def top
    @informations = Information.all
    @schedule = Schedule.where(date: Date.today).order(time: "ASC").first
  end

  def about
  end

  def access
  end
end
