Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :users do
    # Creates users/login(.:format)  users#login
    collection {get 'login'}
  end
  
end