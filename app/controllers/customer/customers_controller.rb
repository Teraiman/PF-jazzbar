class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:quit]

  def quit
    @customer = current_customer
    @customer.update(is_deleted: true) #is_deletedをtrueへ
    reset_session #データをリセットする
    flash[:alert] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def quitcheck
  end

  def show
    @customer = Customer.find(params[:id])
    @artist = @customer.artists
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:alert] = "登録しました"
      redirect_to customer_path(@customer)
    else
      flash[:alert] = "登録できませんでした"
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :postal_cord, :address, :telephone_number, :email)
  end
end
