HippoActivityLog::Engine.routes.draw do
  post '/events' => 'events#create', as: 'event'
  get '/events' => 'events#index', as: 'events'
end
