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

  get 'page', to: 'static_pages#page'
  get 'blog', to: 'static_pages#blog'
  get 'home-alt', to: 'static_pages#home-alt'
  get 'services', to: 'static_pages#services'
  get 'grooming', to: 'static_pages#grooming'
  get 'self-service-grooming', to: 'static_pages#self-service-grooming'
  get 'doggie-daycare', to: 'static_pages#doggie-daycare'
  get 'vet-clinic', to: 'static_pages#vet-clinic'
  get 'retail', to: 'static_pages#retail'

  get 'self-service-locations', to: 'static_pages#self-service-locations'
  
  get 'franchising', to: 'franchise_pages#franchising'
  get 'training-support', to: 'franchise_pages#training-support'
  get 'real-estate', to: 'franchise_pages#real-estate'
  get 'franchise-steps', to: 'franchise_pages#franchise-steps'
  get 'approval-process', to: 'franchise_pages#approval-process'
  get 'faq', to: 'franchise_pages#faq'

  get '/fb', to: 'social#fb'
  get '/insta', to: 'social#insta'
  get '/twitter', to: 'social#twitter'
  get '/pin', to: 'social#pin'
  get '/in', to: 'social#in'

  get '/franchise-inquiries', to: 'candidates#new', as: 'franchise-inquiries'
  post '/franchise-inquiries', to: 'candidates#create'

  get '/vendor', to: 'vendors#new', as: 'vendor'
  post '/vendor', to: 'vendors#create'


  get '/contact', to: 'contacts#new', as: 'contact'
  post '/contact', to: 'contacts#create'
  get 'contacts', to: 'contacts#index'

  get '/media-inquiries', to: 'reporters#new', as: 'media-inquiries'
  post '/media-inquiries', to: 'reporters#create'

  get '/real-estate-submissions', to: 'estates#new', as: 'real-estate-submissions'
  post '/real-estate-submissions', to: 'estates#create'

  get 'tags/:tag', to: 'locations#index', as: :tag

  # get '/estates', to: 'static_pages#page', as: 'estates'


  resources :states

  resources :locations do
    collection do
      post :import
    end
  end

  resources :shops do
    collection do
      post :import
    end
  end

  resources :slides do
    collection do
      patch :sort
    end
  end


  resources :posts, :except => [:index, :new], :path => '' do
    member do
      delete :delete_image_attachment
    end

    collection do
      post :import
    end
  end
  get '/posts/new', to: 'posts#new', as: 'new_post'

  resources :images, only: [:create]


end
