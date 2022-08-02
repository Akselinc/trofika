Rails.application.routes.draw do
  
  root 'pages#home'

  get '/users/:id', to: 'users#show'
  get '/dashboard', to: 'users#dashboard'

  post '/users/edit', to: 'users#update'

  resources :farm_products

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout', edit: 'profile' },
              controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
            
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
