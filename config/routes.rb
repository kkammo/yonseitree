Rails.application.routes.draw do

  resources :uploads

  get 'uploads/create'

  get 'admin' => 'admin#index'
  get 'admin_permit' => 'admin#change_permit'

  root :to => "home#index"

  # devise_for :users
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  resources :projects do
    get 'search', on: :collection
    get "projectall", on: :collection
    get "project_show"
    get "project_edit"
    delete "project_destroy"

    resources :comments
    resources :likes
  end

  resources :directory_semesters do
    resources :directory_classes
  end

  resources :directory_classes do
    resource :directory_homeworks
  end

  resources :directory_homeworks do
    resources :uploads
    resources :projects do
      get "upper", on: :member
      get "branch", on: :member
      get "commit", on: :member
    end
  end

  #resources :directories do
  #  resources :projects
  #  resources :directories
  #end

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
