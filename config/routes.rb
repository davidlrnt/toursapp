Rails.application.routes.draw do
  get '/users/:id/amazon', to: 'users#amazon'

  get '/tours/:id/amazon', to: 'tours#amazon'

  get "/tours/:id/mobiletour", to: 'tours#mobiletour'

  get '/tours/:id/locations/:id/comment', to: 'comments#content'

  get '/tours/:id/locations/:id/video_amazon', to: 'locations#video_amazon'
  get '/tours/:id/locations/:id/image_amazon', to: 'locations#image_amazon'
  get '/tours/:id/locations/:id/audio_amazon', to: 'locations#audio_amazon'

  get '/tours/:id/locations/:id/content', to: 'locations#content'

  get 'image/new'

  # devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #   post 'sign_in', :to => 'devise/sessions#create', :as => :user_session
  # end
  # get "/users/omniauth_callbacks" => "users/omniauth_callbacks#facebook"

  root 'home#index'
  resources :users do
    resources :badges
  end

  
  resources :friendships 

  resources :tours do
    resources :locations
    resources :comments
    resources :reviews
    resources :tags
  end

  resources :locations do
    resources :comments
  end
  resources :tags
  resources :cities

  # resources :users, :only => [:index, :edit, :personal_show]
  resources :searches


  authenticate :user do
    resources :tours
  end



  post '/participate', to: 'tours#participate'
  post '/quit', to: 'tours#quit'
  # get '/user', to: 'users#personal_show'
  # get '/user/:id', to: 'users#public_show'

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  #conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  get "/tours/:id/directions", to: 'tours#get_directions'
  post "/tours/:id/locations/:id/checkin", to: 'locations#checkin'
  post "/tours/:id/locations/:id/checkinstatic", to: 'locations#checkin_static'
  post "publish", to: 'tours#publish'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
