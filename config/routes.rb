Rails.application.routes.draw do
  resources :students do
    resources :assignments
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "students#index"
end
