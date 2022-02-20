Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: %i[index show new create destroy] do
    resources :bookmarks, only: %i[new create]
    resources :movies, only: %i[create]
  end
  resources :bookmarks, only: %i[destroy]
end
