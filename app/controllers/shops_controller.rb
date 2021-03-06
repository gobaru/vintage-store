class ShopsController < ApplicationController

  def index
    @shops = shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :bland, :shop_detail, :image).merge(user_id: current_user.id)
  end




end
