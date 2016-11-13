class CreatorsController < ApplicationController
  before_action :authenticate
  PER = 10

  def index
    @creators = Creator.all
    if (params[:exampleRadios].to_i == 1)
      keyword = (params[:keyword] || '')
      @creators = @creators.where("name like '%" + keyword + "%'" )
    elsif (params[:exampleRadios].to_i == 2)
      tag = (params[:keyword] || '')
      @creators = @creators.tagged_with(tag, :wild => true, :any => true)
    end
    @creators = @creators.page(params[:page]).per(PER)
  end

  def show
    @creator = Creator.find_by(id: params[:id])
    @reviews = @creator.reviews.take(5)
    @review = @creator.reviews.build
  end

  def create
    if current_user.creators.create(creator_params)
      flash[:info] = "ohuse sending was completed!!"
      redirect_to creators_path
    else
      flash[:warning] = "ohuse sending was failed!!"
      redirect_to creators_path
    end
  end

  def destroy
    Creator.find(params[:id]).destroy
    flash[:success] = "ohuse was deleted"
    redirect_to current_user
  end

  private
    def creator_params
      params.require(:creator).permit(:name, :description, :tag_list, :value, :image)
    end
  end
