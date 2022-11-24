Rails.application.routes.draw do
  resources :cakes
  root "cakes#index"
end
