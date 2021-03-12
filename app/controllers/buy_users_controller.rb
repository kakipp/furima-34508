class BuyUsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_buy_users, only: [:index, :create]
    def index
        if @item.buy_user.blank? && current_user.id != @item.user_id
            @buy_user_address = BuyUserAddress.new
        else
            redirect_to root_path
        end
    end

    def create
        @buy_user_address = BuyUserAddress.new(buy_user_params)
        if @buy_user_address.valid?
            pay_item
            @buy_user_address.save
            redirect_to root_path
        else
            render :index
        end
    end

    private

    def buy_user_params
        params.require(:buy_user_address).permit(:address_number, :area_id, :ship_city, :ship_address, :ship_to_address, :telephone).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
    end

    def set_buy_users
        @item = Item.find(params[:item_id])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: @item.price,  
            card: buy_user_params[:token],    
            currency: 'jpy'                
        )
    end
    
end
