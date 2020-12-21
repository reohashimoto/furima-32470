class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  def create
    Item.create(item_params)
  end
  def edit
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :item_category_id, :price, :delivary_fee_id, :shipping_area_id, :days_to_ship_id, :item_explanation, :image).merge(user_id: current_user.id)
  end
 def set_item
  @item = Item.find(params[:id])
 end
end
