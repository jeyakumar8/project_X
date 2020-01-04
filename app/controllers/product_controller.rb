class ProductController < ApplicationController

  def show
    params.require(:id)
    render json: { statusCode: 200 }.merge(present_produt(Product.find(params[:id])))
  end

  def autosuggest
    params.require(:query)
    products = Product.where("lower(name) like lower(:query)", query: "%#{params[:query]}%")
    render json: products.map{|p| present_produt(p)}, status: 200
  end

  private
  def present_produt(product)
    {
      id: product.id,
      name: product.name
    }
  end

end