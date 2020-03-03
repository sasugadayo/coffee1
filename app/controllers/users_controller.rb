class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @shops = user.shops.page(params[:page]).per(5).order("created_at DESC")
  end
end