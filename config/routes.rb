Rails.application.routes.draw do
  use_doorkeeper do
    controllers applications: "oauth_applications"
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      get "/me" => "credentials#me"
    end
  end

  get "/admin" => "admin#index"
  root "home#show"
end
