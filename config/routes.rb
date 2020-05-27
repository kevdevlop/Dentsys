Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :users, except:[:create]

  resources :clients do
    resources :branch_offices do
      resources :patients
      resources :doctors
    end
  end
end
