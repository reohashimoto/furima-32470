class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  
    def index
      if current_user.id == @item.user.id || @item.purchase != nil
        redirect_to root_path
      end
      @purchase_address = PurchaseAddress.new
      end
    def create
      @purchase_address = PurchaseAddress.new(address_params)
      if @purchase_address.valid?
       pay_item
        @purchase_address.save
        redirect_to root_path
      else
        render :index
      end
    end
  private
  def address_params
    params.require(:purchase_address).permit( :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount:@item.price,  # 商品の値段
      card: address_params[:token],    
      currency: 'jpy'                
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
