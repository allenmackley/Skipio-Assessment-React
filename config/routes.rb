Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # http://local.skipio.com
  #
  root "users#index"
  resources :users, only: [:index, :show]
end
