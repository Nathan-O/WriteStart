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

   get "/sessions/destroy", to: "sessions#destroy", as: "logout"

   # Submission Routes #
   get "submissions", to: "submissions#index"

   get "/users/:id/submissions/new", to: "submissions#new"

   post "/submissions", to: "submissions#create"

   get "/submissions/:id", to: "submissions#show"

   get "/submissions/:id/edit", to: "submissions#edit"

   patch "/submissions/:id/edit", to: "submission#update"

   # Edit Routes #
end

#| Prefix Verb  URI Pattern                     Controller#Action
#|            root GET   /                               welcome#index
#|           users GET   /users(.:format)                users#index
#|         sign_up GET   /users/new(.:format)            users#new
#|                 POST  /users(.:format)                users#create
#|         profile GET   /users/:id(.:format)            users#show
#|            user GET   /users/:id/edit(.:format)       users#edit
#|                 PATCH /users/:id/edit(.:format)       users#update
#|           login GET   /sessions/new(.:format)         sessions#new
#|        sessions POST  /sessions(.:format)             sessions#create
#|          logout GET   /sessions/destroy(.:format)     sessions#destroy
#|     submissions GET   /submissions(.:format)          submissions#index
#| submissions_new GET   /submissions/new(.:format)      submissions#new
#|                 POST  /submissions(.:format)          submissions#create
#|                 GET   /submissions/:id(.:format)      submissions#show
#|                 GET   /submissions/:id/edit(.:format) submissions#edit
#|                 PATCH /submissions/:id/edit(.:format) submission#update
