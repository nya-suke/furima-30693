class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :item_edit, only: [:edit, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render "items/new"
    end
  end

  def show
  end

  def edit
    render "edit"
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render "items/edit"
    end
  end

  def destroy

    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name,:information,:category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def item_edit
    if @item.user != current_user
      redirect_to root_path
    end
  end

end