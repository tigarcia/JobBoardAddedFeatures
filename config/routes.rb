Rails.application.routes.draw do
  resources :jobs
  root 'jobs#index'
  #get 'jobs', to: 'jobs#index'
end
