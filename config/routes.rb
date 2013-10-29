Giftdriver::Application.routes.draw do

  devise_for :users

  match '/about' => 'static_pages#about', :as => :about
  match '/faq' => 'static_pages#faq', :as => :faq
  match '/how_it_works' => 'static_pages#how_it_works', :as => :how_it_works

  resources :families, except: [:index, :new, :create] do
    resources :family_members, only: [:index, :new, :create]
  end

  resources :users

  resources :drives do
    resources :families, only: [:index, :new, :create]
    resources :family_member_imports, only: [:new, :create]
    resources :donors, only: [:new, :create, :edit, :update]
    resources :drop_locations, only: [:destroy]
    member do
      get :filter
    end
  end

  resources :family_members, only: [:show, :edit, :update, :destroy] do
    resources :needs
  end

  resources :family_member_imports, only: [:index]

  match 'families/:id/adopt' => 'families#adopt', as: :adopt
  match 'families/:id/update_location_code' => 'families#update_location_code', :via => :post
  match 'families/:id/send_adoption_email' => 'families#send_adoption_email', as: :send_adoption_email
  match 'families/:id/update_gift_status' => 'families#update_gift_status', as: :update_gift_status

  match 'drives/:id/families/manage' => 'drives#manage', as: :manage
  match 'drives/:id/add_organizer' => 'drives#add_organizer', as: :add_organizer
  match 'drives/:id/delete_organizer' => 'drives#delete_organizer', as: :delete_organizer
  match 'drives/:id/drop_locations' => 'drives#drop_locations'  

  root :to => "static_pages#home"

end
