class Staffs::Sales::ProductsController < ApplicationController
  before_action :authenticate_staff!
  before_action :find_products!, only: [:show, :edit, :update]
  def index
    @products = Product::Product.page(params[:page]).per(params[:per_page])
  end

  def show
    puts '#' * 50, Inventory::InventoryItem.all.inspect, @product.contains.inspect
    puts @product.contains.collect { |e| puts e.inspect, e.inventory_item.inspect }
  end

  def new
    @product = Product::Product.new
    @product.contains.new
  end

  def create
    @product = Product::Product.new(product_params)
    set_product_attributes
    add_product_contains
    add_product_price
    change_last_editor
    render_or_redirect_on_save
  end

  def update
  end

  def destroy
  end

  private

  def set_product_attributes
    @product.tap do |o|
      o.sku = product_params[:sku]
      o.name_th = product_params[:name_th]
      o.description_th = product_params[:description_th]
      o.name_en = product_params[:name_en]
      o.description_en = product_params[:description_en]
    end
  end

  def add_product_price
    @product.product_prices.new.tap do |o|
      o.price_th = product_price_params[:product_prices][:price_th]
      o.create_by = current_staff
    end
  end

  def add_product_contains
    product_contains_params[:contains_attributes].each_value do |contain|
      @product.contains.new.tap do |o|
        o.inventory_inventory_item_id = contain[:inventory_inventory_item_id]
        o.quantity = contain[:quantity]
      end
    end
  end

  def change_last_editor
    @product.last_editor = current_staff
  end

  def render_or_redirect_on_save
    if @product.save!
      redirect_to staffs_sales_products_path
    else
      render 'new'
    end
  end

  def find_products!
    @product = Product::Product.includes(contains: :inventory_item).find(params[:id])
  end

  def product_params
    params.fetch(:product_product).permit(:sku, :name_th, :description_th, :name_en, :description_en, :saleable)
  end

  def product_contains_params
    params.fetch(:product_product).permit(contains_attributes: [:inventory_inventory_item_id, :quantity, :_destroy])
  end

  def product_price_params
    params.fetch(:product_product).permit(product_prices: [:price_th])
  end
end