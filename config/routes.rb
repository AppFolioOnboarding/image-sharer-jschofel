Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root controller: 'images', action: 'index'
  resources :images, only: %i[new create show]
end
