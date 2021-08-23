class Admin::HomesController < ApplicationController
  def top
    @informations = Information.all
    # @schedule = Schedule.
  end

  def about
  end

  def access
  end
end
