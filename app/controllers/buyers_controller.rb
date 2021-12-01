class BuyersController < ApplicationController
  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      Payjp.api_key = "sk_test_f2cb41eccab84440f4cd364e"
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :state_id, :city, :line1, :line2, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end