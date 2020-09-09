Rails.application.routes.draw do
  namespace :api do
    get "/all_products" => "products#display_all_products"
  end
end

Rails.application.routes.draw do
  namespace :api do
    get "/head_massager" => "products#display_head_massager"
  end
end

Rails.application.routes.draw do
  namespace :api do
    get "/fender_strat" => "products#display_fender_strat"
  end
end

Rails.application.routes.draw do
  namespace :api do
    get "/cat_bed" => "products#display_cat_bed"
  end
end