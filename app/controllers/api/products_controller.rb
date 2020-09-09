class Api::ProductsController < ApplicationController

  def display_all_products
    @all_products = Product.all
    render "display_all_products.json.jb"
  end

  def display_head_massager
    @found_product_1 = Product.find_by(id: 1)
    render "display_head_massager.json.jb"
  end

  def display_fender_strat
    @found_product_2 = Product.find_by(id: 2)
    render "display_fender_strat.json.jb"
  end

  def display_cat_bed
    @found_product_3 = Product.find_by(id: 3)
    render "display_cat_bed.json.jb"
  end

end

