class AdminsController < ApplicationController
  before_action :authenticate
  before_action :admin_user

  PER = 10
  def index
  end

  def ohuse
    @creators = Creator.all.page(params[:page]).per(PER)
  end

  def ohuse_edit
    @creator = Creator.find(params[:id])
  end

  def ohuse_update
    @creator = Creator.find(params[:id])
    if @creator.update_attributes(creator_params)
      flash[:success] = "Profile updated"
      redirect_to kannri_ohuse_path
    else
      render 'edit'
    end
  end

  def ohuse_destroy
    Creator.find(params[:id]).destroy
    flash[:success] = "ohuse deleted"
    redirect_to kannri_ohuse_path
  end

  def user
    @users = User.all.page(params[:page]).per(PER)
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def user_update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to kannri_user_path
    else
      render 'edit'
    end
  end

  def user_destroy
    User.find(params[:id]).destroy
    flash[:success] = "user deleted"
    redirect_to kannri_user_path
  end

  private
    def creator_params
      params.require(:creator).permit(:name, :description, :tag, :image)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:nickname)
    end
  end
