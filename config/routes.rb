Rails.application.routes.draw do
  resources :state_populations
  resources :flu_mortality2016s
  resources :flu_mortality2015s
  resources :flu_mortality2014s
  resources :states
  root 'flu#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
