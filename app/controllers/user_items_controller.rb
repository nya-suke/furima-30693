class UserItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @user_item_address = UserItemAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item_address = UserItemAddress.new(user_item_params)
    if @user_item_address.valid?
      @user_item_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def user_item_params
    params.require(:user_item_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end




