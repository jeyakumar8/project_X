class ProductController < ApplicationController

  def show
    params.require(:id)
    render json: Product.find(params[:id]), status: 200
  end

  def index
    render json: Product.all, status: 200
  end

  def autosuggest
    params.require(:query)
    products = Product.where("lower(name) like lower(:query)", query: "%#{params[:query]}%")
    render json: products, status: 200
  end

  private
  def present_produt(product)
    {
      id: product.id,
      name: product.name
    }
  end

end