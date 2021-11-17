class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rel = @user.followers.find_by(follower: current_user)

    if !@user.followers.empty?
      @followers = @user.followers.ids
    end

    if !@user.followings.empty?
      @followings = @user.followings.ids
    end
    
  end

end
