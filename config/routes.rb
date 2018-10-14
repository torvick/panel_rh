Rails.application.routes.draw do

  root to: 'home#new'
  resources :sessions
  resources :home
  resources :companies
  resources :employees
  resources :reports
  resources :records

end
