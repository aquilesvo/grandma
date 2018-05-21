class GrandmomsController < ApplicationController
  before_action :set_grandmom, only: [:show, :edit, :update, :destroy]

  def index
    @grandmoms = Grandmom.all
  end

  def show
  end

  def new
    @grandmom = Grandmom.new
  end

  def create
    @grandmom = Grandmom.create(grandmom_params)
    if @grandmom.save
      redirect_to grandmom_path(@grandmom.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @grandmom.update(grandmom_params)
    redirect_to grandmom_path(@grandmom)
  end

  def destroy
    @grandmom.delete
    redirect_to grandmoms_path
  end

  private

  def grandmom_params
    params[:price] = params[:price].to_i
    params.require(:grandmom).permit(:first_name, :last_name, :description, :address, :price, :cooking, :childcare, :storytelling, :goforawalk)
  end

  def set_grandmom
    @grandmom = Grandmom.find(params[:id])
  end
end
