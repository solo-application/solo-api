Rails.application.routes.draw do
  namespace :v1 do
    resources :users, only: [:create, :index, :show, :update] do
      collection do
        get 'current_user' => 'users#current_user'
      end
    end
  end
end
