class UserItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  if current_user.id == @item.user_id
    redirect_to root_path
  end
    if @item.user_item.present? 
      redirect_to root_path
    else
    @user_item_address = UserItemAddress.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_b64fb96bc1e221a08b488f7d"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: user_item_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end




