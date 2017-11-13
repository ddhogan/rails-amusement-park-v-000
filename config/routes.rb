Rails.application.routes.draw do
    
    root 'static#welcome'
    
    resources :users, :attractions, :rides

    # sessions
    get '/signin' => 'sessions#new'
    post '/sessions/create' => 'sessions#create'
    delete '/signout' => 'sessions#signout'
end