Rails.application.routes.draw do

  root to: 'home#index'
  get 'login' => 'home#new'
  resources :sessions
  resources :companies
  resources :employees
  resources :reports
  resources :records
end
