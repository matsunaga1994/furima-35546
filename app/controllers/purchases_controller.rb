class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shopping_address = PurchaseShoppingAddress.new
  end

  def create
    @purchase_shopping_address = PurchaseShoppingAddress.new(purchase_params)
    if @purchase_shopping_address.valid?
      @purchase_shopping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_shopping_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
