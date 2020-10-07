Rails.application.routes.draw do
  resources :tests, only: %i[index] do
    resources :questions, shallow: true
  end
end
