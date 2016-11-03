Rails.application.routes.draw do
  devise_for :users
  root 'stories#index'
end
