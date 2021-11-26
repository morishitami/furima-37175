class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :postage_id, :state_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
