Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, except: %i[edit update]
    resources :questions, shallow: true, only: %i[show destroy]
  end
end
