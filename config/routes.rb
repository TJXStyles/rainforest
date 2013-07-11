Rainforest::Application.routes.draw do
  resources :products
  resources :users, :only => [:new, :create, :show, :update, :edit]
  # get 'products/:id' => 'products#show', as =>'product'

  root :to => 'products#index'

  resources :sessions, :only => [:new, :create, :destroy]

  resources :products do
    resources :reviews, :except => [:index, :edit]
  end

end
