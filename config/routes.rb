Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :stories do
    member do
      put :like, to:'stories#upvote'
      put :dislike, to:'stories#downvote'
    end
  end

  root 'stories#index'
  get '/topstories', to: 'pages#topstories', as: 'topstories'
  get '/randomstories', to: 'pages#randomstories', as: 'randomstories'
  get 'category/:id', to: 'categories#show', as: 'category'
end
