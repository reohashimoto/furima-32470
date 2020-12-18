class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  private
 def set_item
  @item = Item.find(params[:id])
 end
end
