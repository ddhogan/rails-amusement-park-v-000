Rails.application.routes.draw do
    resources :users
    root 'static#welcome'

    get '/signin' => 'sessions#new'
    post '/sessions/create' => 'sessions#create'
end