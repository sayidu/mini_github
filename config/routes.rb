Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :repos
    end
  end
end
