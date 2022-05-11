Rails.application.routes.draw do

    resources :books do
      member do
        post :buy
      end
    end

    resources :orders , only: [] do
      member do
        get :checkout 
      end
    end
    root "books#index"

    
end
