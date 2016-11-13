class UsersController < ApplicationController
  before_action :authenticate
  before_action :find_user, only: [:show, :update, :creators, :ajax, :correct_user]
  before_action :correct_user, only: [:update]
  before_action :find_user_by_user_id, only: [:order_like, :reorder_like, :order_created_at, :reorder_created_at,
    :order_like_more, :reorder_like_more, :order_created_at_more, :reorder_created_at_more,]
  before_action :card_number_reset, only: [:show, :order_like, :reorder_like, :order_created_at, :reorder_created_at]
  before_action :plus_card_number, only: [:order_like_more, :reorder_like_more, :order_created_at_more, :reorder_created_at_more]

  def show
   @creators = @user.creators.order(created_at: :desc).take(4)
   @likes = @user.likes.take(10)
   @ajaxlike = 0
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile was updated"
    else
      flash[:warning] = "no change"
    end
    redirect_to user_path
  end

  def order_created_at
    @creators = @user.creators.reorder(created_at: :desc).take(4)
  end

  def reorder_created_at
    @creators = @user.creators.reorder(created_at: :asc).take(4)
  end

  def order_like
    @creators = @user.creators.reorder(likes_count: :desc).take(4)
  end

  def reorder_like
    @creators = @user.creators.reorder(likes_count: :asc).take(4)
  end

  def order_created_at_more
    @creators = @user.creators.reorder(created_at: :desc)[@card_number,4]
  end

  def reorder_created_at_more
    @creators = @user.creators.reorder(created_at: :asc)[@card_number,4]
  end

  def order_like_more
    @creators = @user.creators.reorder(likes_count: :desc)[@card_number,4]
  end

  def reorder_like_more
    @creators = @user.creators.reorder(likes_count: :asc)[@card_number,4]
  end

  def ajax
    @n = params[:like_params].to_i + 10
    @likes = @user.likes[@n,10]
  end

  private
    def user_params
      params.require(:user).permit(:nickname)
    end

    def find_user
      @user = User.find(params[:id])
    end

    def find_user_by_user_id
      @user = User.find(params[:user_id])
    end

    def card_number_reset
      @card_number = 0
    end

    def plus_card_number
      @card_number = params[:number].to_i+4
    end

    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end
  end
