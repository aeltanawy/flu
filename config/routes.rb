Rails.application.routes.draw do
  resources :drug_mortality2016s
  resources :drug_mortality2015s
  resources :drug_mortality2014s
  resources :state_populations
  resources :flu_mortality2016s
  resources :flu_mortality2015s
  resources :flu_mortality2014s
  resources :states

  # Routes for Chart controller
  get '/chart/flu_mortality', to: 'chart#flu_mortality', as: "flu_mortality_chart"
  get '/chart/drug_mortality', to: 'chart#drug_mortality', as: "drug_mortality_chart"
  get '/chart/flu_vs_drug', to: 'chart#flu_vs_drug', as: "flu_vs_drug_chart"

  # Home page route
  root 'flu#index'
end
