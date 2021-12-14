Rails.application.routes.draw do
  resources :toys, only: %i[index create update destroy]
end
