Flightlog::Application.routes.draw do

  resources :flight_platforms


  resources :user_sessions
  resources :users
  resources :companies
  resources :pilot_fitness_files
  resources :incidents
  resources :batterycharges
  resources :pilots
  resources :batteries

  resources :sessions do
    resources :flights
  end
  get 'register', to: 'companies#new', as: :register
  get 'login', to: 'user_sessions#new', as: :login
  get 'logout', to: 'user_sessions#destroy', as: :logout
  get 'home', to: 'sessions#index', as: :home

  get "static_pages/home"
  get "static_pages/statistics"
  get "static_pages/welcome"
  get "static_pages/admin"

  get "flight_platform/add_battery"


    # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'sessions#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
