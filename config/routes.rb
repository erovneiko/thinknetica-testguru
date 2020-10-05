Rails.application.routes.draw do
  resources :tests, only: :show do
    resources :questions, shallow: true
  end
end
