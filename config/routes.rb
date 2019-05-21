Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :repos, only: %i[index create]
      resource :repos, only: %i[create  destroy] do
        resource :ownerships, only: [:create, :show]
      end
    end
    namespace :v2 do
      resources :repos, only: %i[index create]
      resource :repos, only: %i[create  destroy] do
        resource :ownerships, only: [:create, :show]
      end
    end
  end
end
