class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_product, except: [:new, :create]
  before_action :is_authorised, only: [:edit, :update]

  def new
    @product = current_user.products.build
    @categories = Categories.all
  end

  def create
    @product = current_user.products.build(product_params)
    
    if @product.save
      @product.pricing.create(Pricing.pricing_types.values.map{ |e| {pricing_type: e} })
      redirect_to edit_product_path(@product), notice: 'Saved ...'
    else
      redirect_to request.referrer, flash: { error: @product.errors.full_messages }
    end

  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def is_authorised
    redirect_to root_path, alert: "Something went worng.." unless current_user.id == @product.user_id
  end

  def product_params
    params.require(:product).permit(:title, :video, :active, :category_id, :has_single_pricing,
                                    pricings_attributes: [:id, :title, :description, :delivery_time, 
                                    :price, :pricing_type])
  end

end
