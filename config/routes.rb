Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # http://local.skipio.com
  #
  root "messages#index"
  # post "users/sio_send_sms" => "users#sio_send_sms"
  # resources :users, only: [:index]
  resources :messages, only: [:index, :create]
end
