Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "index#index"

  resources :queue_lists, only: [ :index, :create, :update,:destroy ], :controller => :index
  resources :queue_list_items, only: [:show, :update, :destroy ], :controller => :test do
    get :show_word
  end
  resources :translation, only: [:index, :create, :update, :destroy], :controller => :create_dictionary do
  end
end
