Rails.application.routes.draw do
 
  namespace :nhanvien do
    get 'application/index'
    resources :reports
    resources :taovandons
      resources :vandons do
          member do
            get :search
            get :print
  
          end
       resources :hanghoas do
                 resources :comments, only: [:create]
            end
        resources :nguoinhans
        resources :khachhangs

      end
  end

get 'nackhoiluongs/get_id'
get 'dichvus/get_id'
get 'dichvucongthems/get_id'
get 'tinhs/getvung_id'
get 'cuoccpns/getcuocphi'
get 'dichvucongthems/get_muccuoc'
get 'mucphithuhos/get_mucphi'
# get 'comments/getid'

get 'home/guiSMS'
# get 'vandons/print'
get 'bccps/index'
get 'search/search'

root 'application#index'
    namespace :admin do
                      resources :dashboards
                     resources :mucphithuhos
                    
                      root 'application#index'
                      resources :loaihangs, only: [:new, :create, :destroy]
                      resources :tables , only: [:new, :create, :destroy]
                       
                      resources :vandons do
                             resources :hanghoas do
                                   resources :comments, only: [:create]
                              end

                          resources :khachhangs
                          resources :nguoinhans
                          member do
                            get :print
                          end

                                member  do
                                  get :search
                                end
                        end
                       resources :states
                      resources :dichvus, only: [:new, :create, :destroy]
                      resources :dichvucongthems, only: [:new, :create, :destroy]
                      resources :nackhoiluongs
                       resources :vungs, only: [:new, :create, :destroy]
                      resources :tinhs
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
  resources :states  
  resources :mucphithuhos
  # resources :vandons do

  #   resources :hanghoas
  #   resources :khachhangs
  #   resources :nguoinhans
  #   member do
  #     get :print
  #   end

  #   end
resources :taovandons
  resources :hanghoas, only: [] do
    resources :comments, only: [:create]
  end


	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
