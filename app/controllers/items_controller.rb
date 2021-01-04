class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
     @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @item.purchase != nil 
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_condition_id, :item_category_id, :price, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :item_explanation, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
  end
end
