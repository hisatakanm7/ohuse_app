class LikesController < ApplicationController
  before_action :authenticate
  PER = 40

  def index
    @user = User.find_by(id: params[:user_id])
    @likes = @user.likes.page(params[:page]).per(PER)
  end

  def create
    @like = Like.create(user_id: current_user.id, creator_id: params[:creator_id])
    @likes = Like.where(creator_id: params[:creator_id])
    @creators_likes = Creator.find_by(id: params[:creator_id])
    @id = params[:creator_id]
  end

  def destroy
    Like.find_by(user_id: current_user.id, creator_id: params[:creator_id]).destroy
    @likes = Like.where(creator_id: params[:creator_id])
    @creators = Creator.all
  end
end
