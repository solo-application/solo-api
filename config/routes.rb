Rails.application.routes.draw do
  namespace :v1 do
    post 'users/update'         => 'users#update'
    get 'users/:user_id/search' => 'users#search'
    resources :users, except: [:update] do
      resources :links, except: [:destroy] do
        get 'destroy' => 'links#destroy'
      end
      resources :trips, except: [:destroy] do
        get 'destroy' => 'trips#destroy'
      end
      collection do
        get 'current_user' => 'users#current_user'
      end
    end
  end
end
