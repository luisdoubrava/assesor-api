Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/graphql', to: 'graphql#query'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
end
