class GrandmomsController < ApplicationController
  before_action :set_grandmom, only: [:show, :edit, :update, :destroy]
  before_action :authorize_grandmom, only: [:show, :edit, :update, :destroy]

  def index
    @grandmoms = policy_scope(Grandmom)
    @grandmoms = @grandmoms.where(childcare: params[:childcare]) if params[:childcare].present?
    @grandmoms = @grandmoms.where(cooking: params[:cooking]) if params[:cooking].present?
    @grandmoms = @grandmoms.where(goforawalk: params[:goforawalk]) if params[:goforawalk].present?
    @grandmoms = @grandmoms.where(storytelling: params[:storytelling]) if params[:storytelling].present?
    # filtering_params(params).each do |key, value|
    # @grandmoms = @grandmoms.where(params == true)

  end

  def show
    authorize @grandmom
  end

  def new
    @grandmom = Grandmom.new
    authorize @grandmom
  end

  def create
    @grandmom = Grandmom.new(grandmom_params)
    authorize @grandmom
    @grandmom.owner = current_user
    if @grandmom.save
      redirect_to grandmom_path(@grandmom)
    else
      render :new
    end
  end

  def edit
    authorize @grandmom
  end

  def update
    authorize @grandmom
    @grandmom.update(grandmom_params)
    redirect_to grandmom_path(@grandmom)
  end

  def destroy
    authorize @grandmom
    @grandmom.destroy
    redirect_to grandmoms_path
  end

  private

  def grandmom_params
    params[:price] = params[:price].to_i
    params.require(:grandmom).permit(:first_name, :last_name, :description, :address, :price, :cooking, :childcare, :storytelling, :goforawalk, :photo)
  end

  def set_grandmom
    @grandmom = Grandmom.find(params[:id])
  end

  def authorize_grandmom
    authorize @grandmom
  end
end
