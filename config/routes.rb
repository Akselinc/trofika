Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout', edit: 'profile', registration: 'register' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
