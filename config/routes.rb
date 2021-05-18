Rails.application.routes.draw do
  get 'chats/show'
  get 'search/search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  get '/search', to: 'search#search'

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
