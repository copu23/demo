Rails.application.routes.draw do
 
get 'nackhoiluongs/get_id'
get 'dichvus/get_id'
get 'dichvucongthems/get_id'
get 'tinhs/getvung_id'
get 'cuoccpns/getcuocphi'
get 'dichvucongthems/get_muccuoc'
get 'cuoccpns/tong_cuoc'

  namespace :admin do
    root 'application#index'
    resources :loaihangs, only: [:new, :create, :destroy]
    resources :tables , only: [:new, :create, :destroy]
     
    resources :vandons

    resources :dichvus, only: [:new, :create, :destroy]
    resources :dichvucongthems, only: [:new, :create, :destroy]
    resources :nackhoiluongs, only: [:new, :create, :destroy]
     resources :vungs, only: [:new, :create, :destroy]
    resources :tinhs, only: [:new, :create, :destroy]
      resources :cuoccpns, only: [:new, :create, :destroy]

    resources :users do
	    member do
		  patch :archive
		  end
	   end
  end
   
       

  root "home#index"


	resources :loaihangs, only: [:index, :show, :edit, :update]
  resources :tables, only: [:index, :show, :edit, :update]
  resources :dichvus , only: [:index, :show, :edit, :update]
  resources :dichvucongthems , only: [:index, :show, :edit, :update]
  resources :nackhoiluongs , only: [:index, :show, :edit, :update]
  resources :vungs , only: [:index, :show, :edit, :update]
  resources :tinhs , only: [:index, :show, :edit, :update]
  resources :cuoccpns, only: [:index, :show, :edit, :update]
      
  resources :vandons do
    resources :hanghoas
    resources :khachhangs
    resources :nguoinhans


    end
  resources :hanghoas, only: [] do
    resources :comments, only: [:create]
  end


	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
