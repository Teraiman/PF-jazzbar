class Customer::HomesController < ApplicationController
  def top
    @informations = Information.all
    @schedule = Schedule.where(date: Date.today.in_time_zone('Tokyo')).order(time: "ASC").first
  end

  def about
  end

  def access
  end
end
