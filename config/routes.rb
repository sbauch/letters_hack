LettersServer::Application.routes.draw do
  mount Gamepi::API => '/api'

end
