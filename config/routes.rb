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
  get 'contact-us', to: 'static_pages#contact-us'
  get 'pet-stores', to: 'static_pages#pet-stores'
  get 'services', to: 'static_pages#services'
  get 'press', to: 'static_pages#press'
  get 'grooming', to: 'static_pages#grooming'
  get 'self-service-grooming', to: 'static_pages#self-service-grooming'
  get 'doggie-daycare', to: 'static_pages#doggie-daycare'
  get 'vet-clinic', to: 'static_pages#vet-clinic'
  get 'retail', to: 'static_pages#retail'

  get 'franchise-faqs', to: 'franchise_pages#franchise-faqs'
  get 'franchise-process', to: 'franchise_pages#franchise-process'
  get 'franchise-inquiry', to: 'franchise_pages#franchise-inquiry'
  get 'franchise', to: 'franchise_pages#franchise'
  get 'franchise-opportunity', to: 'franchise_pages#franchise-opportunity'
  get 'training-support', to: 'franchise_pages#training-support'
  get 'franchisees', to: 'franchise_pages#franchisees'
  get 'investment-details', to: 'franchise_pages#investment-details'
  get 'next-steps', to: 'franchise_pages#next-steps'
  get 'real-estate', to: 'franchise_pages#real-estate'

  get '/fb', to: 'social#fb'
  get '/insta', to: 'social#insta'
  get '/twitter', to: 'social#twitter'
  get '/pin', to: 'social#pin'
  get '/in', to: 'social#in'

  get '/franchise-inquiries', to: 'candidates#new', as: 'franchise-inquiries'
  post '/franchise-inquiries', to: 'candidates#create'

  get '/contact', to: 'contacts#new', as: 'contact'
  post '/contact', to: 'contacts#create'

  resources :locations do
    collection do
      post :import
    end
  end

  resources :posts
  resources :blogs
end
