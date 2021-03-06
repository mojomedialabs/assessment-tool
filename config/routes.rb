AssessmentTool::Application.routes.draw do
  get 'password_resets/new'

  get 'login' => 'sessions#new', :as => 'login'

  get 'logout' => 'sessions#destroy', :as => 'logout'

  post 'versions/:id/revert' => 'versions#revert', :as => 'revert_version'

  get '418' => 'pages#error418', :as => 'error418'

  resources :assessments, :only => [:index, :show] do
    collection do
      get :summary
    end
    member do
      get :results
      post :update_response
    end
  end

  resources :pages, :only => [:index, :show]

  resources :password_resets, :only => [:new, :create, :edit, :update]

  resources :posts, :only => [:index, :show]

  resources :sessions, :only => [:new, :create, :destroy]

  resources :users, :only => [:edit, :update]

  namespace :admin do
    root :to => 'admin#index'

    get 'reboot' => 'admin#reboot', :as => 'reboot'

    resources :assessments do
      collection do
        get :edit_multiple
        put :update_multiple
        post :destroy_multiple
      end
    end

    resources :pages do
      collection do
        get :edit_multiple
        put :update_multiple
        post :destroy_multiple
      end
    end

    resources :pictures do
      collection do
        get :selector
      end
    end

    resources :posts do
      collection do
        get :edit_multiple
        put :update_multiple
        post :destroy_multiple
      end
    end

    resources :users do
      collection do
        get :edit_multiple
        put :update_multiple
        post :destroy_multiple
      end
    end
  end

  root :to => 'pages#index'

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
  # match ':controller(/:action(/:id(.:format)))'
end
