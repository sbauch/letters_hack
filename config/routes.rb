LettersServer::Application.routes.draw do
  mount Gamepi::API => '/api'

  root :to => '/api'

end
