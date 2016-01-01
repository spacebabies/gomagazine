Rails.application.routes.draw do
  root to: "welcome#index"

  resources :articles
  resources :authors
end
