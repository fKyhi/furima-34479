class PurchasesController < ApplicationController
  def index
    @purchase_order = PurchaseOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    # @purchase = Purchase.create(purchase_params)
    # Order.create(order_params)
    # redirect_to root_path
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new(purchase_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_order).permit(:post_code, :prefecture_id, :city, :addressed, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  # def purchase_params
  #   params.permit(:item_id).merge(user_id: current_user.id)
  # end

  # def order_params
  #   params.permit(:post_code, :prefecture_id, :city, :addressed, :building, :phone_number).merge(purchase_id: @purchase.id)
  # end
end
