class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:quit]

  def quit
  end

  def quitcheck
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end
  
  def destroy
    @customer = current_customer(params[:id])
    @customer.destroy
    flash[:success] = '全てのデータを削除しました。'
    redirect_to :customers_quit
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :postal_cord, :address, :telephone_number, :email)
  end
end
