class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
     @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
     redirect_to root_path unless current_user.id == @item.user_id
  end
=begin 
  def update
     @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
=end

  private

  def item_params
    params.require(:item).permit(:image,:name,:detail,:category_id,:condition_id,:delivery_fee_id,:prefecture_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end