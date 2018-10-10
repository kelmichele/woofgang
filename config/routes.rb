Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  # get 'home-full', to: 'static_pages#home-full'

  get '/fb', to: 'social#fb'
  get '/insta', to: 'social#insta'
  get '/twitter', to: 'social#twitter'
  get '/pin', to: 'social#pin'
  get '/in', to: 'social#in'
end
