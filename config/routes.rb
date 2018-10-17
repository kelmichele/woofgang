Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'account', to: 'devise/sessions#show'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'about-us', to: 'static_pages#about-us'
  get 'contact', to: 'static_pages#contact'
  get 'franchise-faq', to: 'static_pages#franchise-faq'
  get 'franchise-process', to: 'static_pages#franchise-process'
  get 'franchise-inquiries', to: 'static_pages#franchise-inquiries'
  get 'franchise', to: 'static_pages#franchise'
  get 'retail', to: 'static_pages#retail'
  get 'services', to: 'static_pages#services'
  get 'press', to: 'static_pages#press'

  get '/fb', to: 'social#fb'
  get '/insta', to: 'social#insta'
  get '/twitter', to: 'social#twitter'
  get '/pin', to: 'social#pin'
  get '/in', to: 'social#in'

  resources :locations do
    collection do
      post :import
    end
  end

  resources :posts
  resources :blogs
  # get 'tags/:tag', to: 'locations#index', as: :tag
end
