Rails.application.routes.draw do
  root to: 'article#search'

  post '/', to: 'article#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
