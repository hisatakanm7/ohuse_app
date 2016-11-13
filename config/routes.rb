Rails.application.routes.draw do

  resources :users, only: [:show, :update] do
    resources :likes, only: [:index, :create, :destroy]
    get :order_created_at, :reorder_created_at, :order_like, :reorder_like,
    :order_created_at_more, :reorder_created_at_more, :order_like_more, :reorder_like_more
  end

  resources :creators do
    resources :likes, only: [:create, :destroy]
    resources :reviews, only: [:index, :create]
  end

  root 'static_pages#index'
  get '/auth/:provider/callback' => "sessions#create"
  get "/logout" => "sessions#destroy", as: :logout

  get 'users/:id/creator' => 'users#creators', as: :user_creators
  get 'users/:id/like' => 'users#ajax', as: :user_ajax
  get  '/kannri' => 'admins#index'
  get  '/kannri/ohuse' => 'admins#ohuse'
  get  '/kannri/ohuse/:id/edit' => 'admins#ohuse_edit'
  patch  '/kannri/ohuse/:id' => 'admins#ohuse_update', as: :ohuse_update
  get  '/kannri/ohuse/:id' => 'admins#ohuse_destroy', as: :ohuse_destroy
  get  '/kannri/user' => 'admins#user'
  get  '/kannri/user/:id/edit' => 'admins#user_edit'
  patch  '/kannri/user/:id' => 'admins#user_update', as: :user_update
  get  '/kannri/user/:id' => 'admins#user_destroy', as: :user_destroy



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
