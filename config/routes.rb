LettersServer::Application.routes.draw do
  mount Gamepi::API => '/api'

  root :to => 'application#home'

end
