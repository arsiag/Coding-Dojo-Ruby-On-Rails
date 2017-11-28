Rails.application.routes.draw do

  # resources :sessions, only: [:new, :create, :destroy]
  # resources :users
  # resources :secrets, only: [:index]
  # resources :likes, only: [:create, :destroy]
  
  # get "sessions" => "sessions#index"
  get "sessions/new" => "sessions#new"
  post "sessions" => "sessions#create"
  # get "sessions/:id" => "sessions#show"
  # get "sessions/:id/edit" => "sessions#edit"
  # patch "sessions/:id" => "sessions#update"
  delete "sessions/:id" => "sessions#destroy"

  get "users" => "users#index"
  get "users/new" => "users#new"
  post "users" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

  get "secrets" => "secrets#index"
  # get "secrets/new" => "secrets#new"
  post "secrets" => "secrets#create"
  # get "secrets/:id" => "secrets#show"
  # get "secrets/:id/edit" => "secrets#edit"
  # patch "secrets/:id" => "secrets#update"
  delete "secrets/:id" => "secrets#destroy"

  # get "likes" => "likes#index"
  # get "likes/new" => "likes#new"
  post "likes" => "likes#create"
  # get "likes/:id" => "likes#show"
  # get "likes/:id/edit" => "likes#edit"
  # patch "likes/:id" => "likes#update"
  delete "likes/:id" => "likes#destroy"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
