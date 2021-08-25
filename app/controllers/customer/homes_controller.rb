class Customer::HomesController < ApplicationController
  def top
    @informations = Information.all
    
  end

  def about
  end

  def access
  end
end
