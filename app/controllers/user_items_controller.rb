class UserItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :current_user_index, only: [:index, :create]

  def index
    if @item.user_item.present? 
      redirect_to root_path
    else
    @user_item_address = UserItemAddress.new
    end
  end

  def create
    @user_item_address = UserItemAddress.new(user_item_params)
    if @user_item_address.valid?
      pay_item
      @user_item_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def user_item_params
    params.require(:user_item_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def current_user_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = ENV["PAYJP_PUBLIC_KEY"]   
    Payjp::Charge.create(
      amount: @item.price,  
      card: user_item_params[:token],    
      currency: 'jpy'                 
    )
  end
end




