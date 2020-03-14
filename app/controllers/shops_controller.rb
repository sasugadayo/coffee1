class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]


  def index
    @shops = Shop.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @shop = Shop.new
  end
  def create
    Shop.create(shop_params)
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
  end

  def edit
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
  end

  def show
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)
  end

  def search
    @shops = Shop.search(params[:keyword])
  end

  private
  def shop_params
    params.require(:shop).permit(:image, :text, :title).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
