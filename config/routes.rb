Rails.application.routes.draw do
  root to: 'lists#index'
  get 'lists', to: 'lists#index'
  get 'lists/new', to: 'lists#new', as: 'new_list'
  post 'lists', to: 'lists#create'
  get 'lists/:id', to: 'lists#show', as: 'list'


  get 'bookmarks/new', to: 'bookmarks#new', as: 'new_bookmark'
  post 'bookmarks', to: 'bookmarks#create'
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: 'bookmark'

end
