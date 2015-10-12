Rails.application.routes.draw do
   root to: "welcome#index"

   # User Routes #
   get 'users', to: "users#index"

   get '/users/new', to: "users#new", as: "sign_up"

   post "/users", to: "users#create"

   get "/users/:id", to: "users#show", as: "profile"

   get "/users/:id/edit", to: "users#edit", as: "user"

   patch "/users/:id/edit", to: "users#update"

   # Sessions Routes #
   get "/sessions/new", to: "sessions#new", as: "login"

   post "/sessions", to: "sessions#create"

   delete "/sessions/destroy", to: "sessions#destroy", as: "logout"
end
