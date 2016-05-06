Rails.application.routes.draw do
 
  get 'photos/index' 

  get 'photos/new'

  get 'photos/create'

  get 'photos/destroy'

 
  post 'photos/:id/edit' => 'photos#edit'

 


  post 'photos/:id/edit/rotate' => 'photos#rotate'

  post 'photos/:id/edit/black_and_white' => 'photos#black_and_white'

  post 'photos/:id/edit/sepia' => 'photos#sepia'

  post 'photos/:id/edit/sharpen' => 'photos#sharpen'

  post 'photos/:id/edit/scale' => 'photos#scale'

  post 'photos/:id/edit/flip' => 'photos#flip'

  post 'photos/:id/edit/charcoal' => 'photos#charcoal'  

  post 'photos/:id/edit/blue_shift' => 'photos#blue_shift'

  post 'photos/collage' => 'photos#collage'


  get 'photos/collage' => 'photos#collage'

  get 'photos/:id/edit/flip' => 'photos#flip'

  get 'photos/:id/edit/scale' => 'photos#scale'

  get 'photos/:id/edit/sharpen' => 'photos#sharpen'

  get 'photos/:id/edit/sepia' => 'photos#sepia'

  get 'photos/:id/edit/rotate' => 'photos#rotate'

  get 'photos/:id/edit/black_and_white' => 'photos#black_and_white'

  get 'photos/:id/edit/charcoal' => 'photos#charcoal'  

  get 'photos/:id/edit/blue_shift' => 'photos#blue_shift'
  
resources :photos, only: [:index, :new, :create, :destroy, :edit, :update]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'photos#index'

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
