class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @shops = @user.shops.page(params[:page]).per(5).order("created_at DESC")
    @favorite_shops = @user.favorite_ids
  end
end