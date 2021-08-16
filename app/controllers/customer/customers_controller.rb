class Customer::CustomersController < ApplicationController
  def quit
  end

  def quitcheck
  end

  def show
    @customer = current_customer
  end

  def edit
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :postal_cord, :address, :telephone_number, :email)
  end
end
