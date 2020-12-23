class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index]
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
  #def edit
  #end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_condition_id, :item_category_id, :price, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :item_explanation, :image).merge(user_id: current_user.id)
  end
 def set_item
  @item = Item.find(params[:id])
 end
end
