class FarmProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_farm_product, except: [:new, :create]
  before_action :is_authorised, only: [:edit, :update]

  def new
    @farm_product = current_user.farm_products.build
    @categories = Category.all
  end

  def create
    @farm_product = current_user.farm_products.build(farm_product_params)
    if @farm_product.save
      redirect_to edit_farm_product_path(@farm_product), notice: "Saved...."
    else
      redirect_to request.referrer, flash: { error: @farm_product.errors.full_messages }
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  

  private
  def set_farm_product
    @farm_product = FarmProduct.find(params[:id])
  end

  def is_authorised
    redirect_to root_path, alert: "Hmmm something is not right." unless current_user.id == @farm_product.user_id
  end

  def farm_product_params
    params.require(:farm_product).permit(:title, :video, :has_variant, :has_single_pricing, :active, :category_id)
  end

end
