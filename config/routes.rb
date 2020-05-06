Rails.application.routes.draw do
  devise_for :users

  root 'projectts#index'

  resources :users do

    resources :projectts do

      resources :bugs do
        get '/show_user', to: 'users#show_user'
        get '/add_buguser/:id/', to: 'users#add_buguser', as: 'add_buguser'
        delete '/destroy_buguser/:id', to: 'users#destroy_buguser', as: 'destroy_buguser'
      end


      get '/show_user/', to: 'projectts#show_user'
      get '/add_user/:id/', to: 'projectts#add_user', as: 'add_user'
      delete '/destroy_user/:id', to: 'projectts#destroy_user', as: 'destroy_user'

    end
  end
end
