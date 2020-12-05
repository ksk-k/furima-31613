class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order_form = OrderForm.new
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_form_params[:token],
        currency: 'jpy'
      )
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

