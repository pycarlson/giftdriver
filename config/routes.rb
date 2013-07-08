Giftdriver::Application.routes.draw do

  devise_for :users

  match '/about' => 'static_pages#about', :as => :about
  
  match '/team' => 'static_pages#team', :as => :team

  resources :families, except: [:index, :new, :create] do
    resources :family_members, only: [:index, :new, :create]
  end

  resources :drives do
    resources :families, only: [:index, :new, :create]
    resources :family_member_imports, only: [:new, :create]
    resources :donors, only: [:new, :create]
  end

  resources :family_members, only: [:show, :edit, :update, :destroy] do
    resources :needs
  end

  match '/families/:id/adopt' => 'families#adopt', as: :adopt
  
  match 'drives/:id/families/manage' => 'drives#manage', as: :manage

  match 'families/:id/update_arrived' => 'families#update_arrived', as: :update_arrived
  match 'families/:id/update_gift_status' => 'families#update_gift_status', as: :update_gift_status
  match 'families/:id/update_given' => 'families#update_given', as: :update_given

  match 'drives/:id/add_organizer' => 'drives#add_organizer', as: :add_organizer

  match 'drives/:id/delete_organizer' => 'drives#delete_organizer', as: :delete_organizer
  match 'drives/:id/drop_locations' => 'drives#drop_locations'

  root :to => "drives#index"


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
