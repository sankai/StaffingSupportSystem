StaffingSystem::Application.routes.draw do

  resources :skillsets


  devise_for :users

  root :to => 'menu#show'
  
  match 'assignments/new/:id' => 'assignments#new'

  match 'assignments/assignmember/:id'    => 'assignments#assignmember'

  match 'assignments/assigningmember/:id'    => 'assignments#assigningmember'

  match 'assignments/release/:id/:member_id'    => 'assignments#release'

  match 'ankens/upload' => 'ankens#upload'

  match 'ankens/index' => 'ankens#index'

  match 'ankens/index/:page' => 'ankens#index'

  match 'members/upload' => 'members#upload'
  
  match 'depts/upload' => 'depts#upload'

  match 'members_by_shell' => 'members#index_by_shell'    

  match 'members_on_grid' => 'members#index_on_grid'    

  resources :skillset_roles


  resources :members


  resources :skillset_langs


  resources :skillset_rolls


  resources :depts


  resources :ankenstatuses


  resources :assignments


  resources :ankens


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
