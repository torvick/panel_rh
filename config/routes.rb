Rails.application.routes.draw do

  root to: 'home#index'
  get 'login' => 'home#new'

  resources :sessions do
    collection { post :logout}
  end
  resources :companies
  resources :employees
  resources :reports
  resources :records
end
