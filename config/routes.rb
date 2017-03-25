Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :users do
    # Creates users/login(.:format)  users#index
    collection {get 'login'}
  end
      
  
# Work around the Bad URI bug
#  %w{ users }.each do |i|
#    match "#{i}", :to => "#{i}#index", :format => false
#    get "#{i}(/:action)", :to => i, :format => false, as: :login_user
#    match "#{i}(/:action(/:id))", :to => i, :id => nil, :format => false
# end

# get 'users/login',   to: 'users#login', :format => false
  
end