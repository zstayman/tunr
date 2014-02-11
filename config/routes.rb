Tunr::Application.routes.draw do

resources :artists do
  resources :songs, except: [:index, :show]
end


resources :users

root "welcome#index"
end

