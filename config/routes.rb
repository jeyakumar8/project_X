Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :product, only: [:show, :index] do
    collection do
      get 'autosuggest'
    end
  end

  resources :store, only: [] do
    collection do
      get 'search'
    end
  end
    post '/calculate_distance', to: 'distance#calculate_distance'
    post '/create_user', to: 'user#create_user'
    post '/proceed_to_pay', to: 'distance#proceed_to_pay'

end
