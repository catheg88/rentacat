class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    # @cat_name = @cat.name
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def create
    @cat = Cat.create!(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      redirect_to cats_url
    end
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update!(cat_params)
    redirect_to cats_url
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :text, :sex, :name)
  end



end
