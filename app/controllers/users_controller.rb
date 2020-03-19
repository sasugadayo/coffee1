class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @shops = @user.shops.page(params[:page]).per(5).order("created_at DESC")
    # binding.pry
    # @favorite_shops = @user.favorite_ids
    # binding.pry
    # mapメソッドを使いfavoriteをtweetの情報に変換
    @favorite_shops = @user.favorites.map{|favorite| favorite.shop}

  end
end