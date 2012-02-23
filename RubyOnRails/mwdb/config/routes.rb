Mwdb::Application.routes.draw do


  get "avaliacaos/new"

  get "avaliacaos/create"

  resources :users

  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'pages#home'

  match '/contacts',:to => 'pages#contacts'
  match '/about', :to => 'pages#about'

  #Paths para invocação de funções de renderização de imagens
  match '/application/code_image' , :to => 'application#code_image'
  match '/application/code_tipo_thumb' , :to => 'application#code_tipo_thumb'
  match '/application/code_image_marcas' , :to => 'application#code_image_marcas'
  match '/application/code_image_modelos' , :to => 'application#code_image_modelos'
  match '/application/code_image_foto_modelos' , :to => 'application#code_image_foto_modelos'
  match '/application/code_image_miniaturas' , :to => 'application#code_image_miniaturas'
  match '/application/code_image_foto_miniaturas' , :to => 'application#code_image_foto_miniaturas'

  #Rota para criaçao de um novo utilizador
  match '/signup', :to => 'users#new'

  #Rotas para criação e destruição de sessões
  match '/signin'  , :to => 'sessions#new'
  match '/signout' , :to => 'sessions#destroy'


  match '/admin' , :to => 'admin#show'

  match 'utilizadores' , :to => 'utilizadores#show'

  namespace :admin do
    resources(:escalas ,:only => [:index,:new,:create,:destroy,:edit,:update])
    resources(:construtors ,:only =>[:index,:new,:create,:destroy,:edit,:update])
    resources(:tipos ,:only => [:index,:new,:create,:destroy,:edit ,:update])
    resources(:marcas ,:only => [:index,:new,:create,:destroy,:edit,:update])
    resources(:modelos , :only => [:index,:new,:create,:destroy,:edit,:update]) do
            resources(:foto_modelos , :only => [:index,:new,:create,:destroy])
    end
    resources(:miniaturas, :only =>[:index,:new,:create,:edit,:update,:destroy]) do
            resources(:foto_miniaturas , :only => [:index,:new,:create,:destroy])
    end

  end

  namespace :utilizadores do
    resources :escalas , :only => [:index] do
      resources :miniaturas, :only => [:index]
    end
    resources :construtors, :only =>[:index] do
      resources :miniaturas , :only => [:index]
    end
    resources :tipos , :only => [:index] do
      resources :marcas , :only => [:index]
    end
    resources :marcas , :only => [:index] do
      resources :modelos , :only => [:index]
    end
    resources :modelos , :only => [:index, :show] do
      resources :foto_modelos , :only => [:index]
      resources :miniaturas , :only => [:index]
    end
    resources :miniaturas, :only => [:index,:show] do
      resources :foto_miniaturas, :only => [:index]
    end
    resources :comentarios , :only => [:new ,:create]
    resources :avaliacaos , :only => [:new, :create]
  end


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
