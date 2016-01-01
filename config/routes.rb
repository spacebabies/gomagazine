Rails.application.routes.draw do
  root to: "welcome#index"

  resources :authors
  resources :articletypes do
    resources :articles, shallow: true
  end
end
