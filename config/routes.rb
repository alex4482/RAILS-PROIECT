Rails.application.routes.draw do
  devise_for :users
 root to: 'items#index' , as: 'home'

 resources :items

    get '/users/:id' => 'user#show', as: 'user'   
    get '/users/:id/history' => 'user#history' ,as: 'history'
    post 'rent/:id' => 'items#rent', as: 'rent'
    post 'give_back/:id' => 'items#give_back', as: 'give_back'
    get 'search' => 'items#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
