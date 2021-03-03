class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def index
        @items = Item.includes(:user)
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        if @item.save
            redirect_to root_path(@item)
        else
            render :new
        end
    end

    private

    def item_params
        params.require(:item).permit(:image, :name, :delivery_id, :delivery_days_id, :area_id, :status_id, :description, :category_id, :price).merge(user_id: current_user.id)
    end
end
