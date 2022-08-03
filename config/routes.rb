Rails.application.routes.draw do
  
  get 'products/new'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/show'
  root 'pages#home'

  get '/users/:id', to: 'users#show'
  get '/dashboard', to: 'users#dashboard'

  post '/users/edit', to: 'users#update'

  resources :products

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout', edit: 'profile' },
              controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
            
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
