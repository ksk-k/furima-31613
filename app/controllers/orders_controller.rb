class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      binding.pry
      Payjp.api_key = "sk_test_8e52814ee97fb2d2a6823ee2"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_form_params[:token],
        currency: 'jpy'
      )
      @order_form.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
end

