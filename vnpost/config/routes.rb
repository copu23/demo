Rails.application.routes.draw do
 

  namespace :admin do
    get 'application/index'
    resources :loaihangs, only: [:new, :create, :destroy]
    
    resources :users
  end

  root "home#index"


	resources :loaihangs, only: [:index, :show, :edit, :update]
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
