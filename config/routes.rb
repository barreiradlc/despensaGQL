Rails.application.routes.draw do
  resources :provimentos
  
  # if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  # end

  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, param: :_username
  
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  
end
