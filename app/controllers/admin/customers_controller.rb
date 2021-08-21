class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    #@customers = Customer.all
    @customers = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def edit_memo
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

private

   def customer_params
     	params.require(:customer).permit(
     	  :name,
     	  :name_kana,
     	  :email,
     	  :postal_cord,
     	  :address,
     	  :telephone_number,
     	  :memo,
     	  :is_deleted
     	  )
   end
end
