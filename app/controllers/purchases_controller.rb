class PurchasesController < ApplicationController
    def index
      @item = Item.find(params[:item_id])
      @purchase_address = PurchaseAddress.new
    end
    def create
      @purchase_address = PurchaseAddress.new(address_params)
      if @purchase_address.valid?
        @purchase_address.save
      end
    end
  private
  def address_params
    params.require(:purchase_address).permit(:user, :item, :postal_code, :prefecture, :municipality, :address, :building_name, :telephone_number)
  end
  
end
