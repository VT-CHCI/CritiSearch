Platypus::Application.routes.draw do

  

  

  resources :follows

  resources :ratings

  resources :rating_values

  resources :admins

  resources :course_offerings

  resources :admin_assignments

  resources :role_assignments

  resources :section_assignments

  resources :meeting_times

  resources :sections

  resources :courses

  resources :schools

  resources :roles

  devise_for :people, :controllers => {:registrations => "registrations", :sessions => "sessions"} #do
  #   member do
  #     get 'preview'
  #   end
  # end

  scope "/admin" do
    resources :people
    # admin.resources :reflections
  end

  namespace :admin do
    resources :reflections
    resources :searches
  end

  match "/students" => "people#index", :defaults => {:role => :student}
  match "/teachers" => "people#index", :defaults => {:role => :teacher}

  get "search/index"
  get "search/query"
  get "search/ajax"

  match "/venn/:query" => "venn#show"
  match "/venn" => "venn#index"
  match "/askthem/:query" => "ask_audience#show"
  match "/askthem" => "ask_audience#index"

  resources :search_items

  resources :search_lists

  match '/admin' => "admins#index"
  # match '/students' =>

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match 'search' => 'search#result', as: 'search'

  match '/ajaxratings' => 'ratings_service#rate', :via => :post
  match '/addfollow' => 'follow_service#create', :via => :post
  match "/reflection" => "reflection_service#create", :via => :post

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
  root to: 'search#index', as: 'start'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
