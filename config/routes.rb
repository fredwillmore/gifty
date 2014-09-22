Gifty::Application.routes.draw do
  # match :admin, :to => 'admin/dashboards#index'
  namespace :admin do
    root to: "admin/dashboards#index"
    # get 'index', to: 'dashboard#index', as: '/'
    # get '', to: 'dashboard#index', as: '/'

    # resources :merchant_types
    # resources :roles
    #
    # resources :locations
    # resources :purchases
    #
    # resources :merchants
    # get '/get_merchants_by_area' => 'merchants#get_by_area'
    #
    # resources :gifts
  end

  devise_for :users
  resources :users, :only => [:index, :show, :edit, :new, :update] do
    member do
      get 'favorites'
      #post 'update_favorite'
      get 'friends'
      get 'friend_search'
    end
  end
  post '/update_favorite' => 'users#update_favorite'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root "home#index"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
