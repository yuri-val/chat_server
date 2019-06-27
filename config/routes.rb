Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post :login, to: 'auth#login'
  resources :users, only: [:index, :show]
  resources :rooms do
    post :join
    post :leave
  end
  post :message, to: 'messages#create'
end
