Rails.application.routes.draw do
  namespace :v1 do
    get 'users/:user_id/search' => 'users#search'
    resources :users, only: [:create, :show, :update] do
      resources :links, only: [:create, :index, :show, :destroy]
      collection do
        get 'current_user' => 'users#current_user'
      end
    end
  end
end
