Rails.application.routes.draw do

  resources :comments
  resources :meetusers
  resources :meetings 
  resources :eventusers
  get 'profiles/show/:id' => 'profiles#show' , :as=>'profiles_show'
  get 'meeting/:meeting_id/event/:id' => 'events#show' , :as=>'meeting_event'
  #get 'event/:event_id/commentevent/:id' => 'commentevents#destroy' , :as=>'event_commentevent'
  delete 'event/:event_id/commentevent/:id' => 'commentevents#destroy' , :as=>'event_commentevent'  
 
  patch 'event/:event_id/commentevent/:id', controller: 'commentevents', action: :update
  put 'event/:event_id/commentevent/:id', controller: 'commentevents', action: :update

  patch 'meeting/:meeting_id/event/:id', controller: 'events', action: :update
  put 'meeting/:meeting_id/event/:id', controller: 'events', action: :update

  delete 'meeting/:meeting_id/event/:id', controller: 'events', action: :destroy

  #patch '/events/:event_id/commentevents/:id/edit' => 'commentevents#edit ' , :as=>'edit_event_commentevent'  
  #patch '/events/:event_id/commentevents/:id' => 'commentevents#update ' , :as=>'event_commentevent' 
  #patch    '/events/:event_id/commentevents/:id'=>' commentevents#update' , :as=>'edit_event_commentevent'
 # patch 'event/:event_id/commentevent/:id' => 'commentevents#update' , :as=>'event_commentevent'
  #resources :comments
  
  #resources :meetings
	#get 'meetings#index'  
# The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # You can have the root of your site routed with "root"
   root 'meetings#index'


  resources :meetings do
  	resources :comments
        resources :meetusers
        
  end

  resources :meetings do 
	resources :events
  end   

  resources :events do 
	resources :commentevents
        resources :eventusers
  end      

    resources :shows




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
