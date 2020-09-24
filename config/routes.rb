Rails.application.routes.draw do
  resources :tests, only: [] do
    resources :questions, shallow: true, except: %i[edit update]
  end
end
