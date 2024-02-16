Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "/collections/:id/issues/new", to: "collection_issues#create"

  resources :issues do
    collection do
      get 'export_csv'
    end
  end
  
  get "collections/:id/export_csv", to: "collection_issues#export_csv"

  resources :collections, except: :show do
    resources :issues, controller: "collection_issues"
  end

  # resources :collection_issues
  resources :issues
  # resources :collection_issues

  # get "/collections/:id/issues", to: "collection_issues#index"
  # get "/collections/:id/new", to: "collection_issues#new"
  # post "/collections/:id/new", to: "collection_issues#new"
  # Defines the root path route ("/")
  # root "posts#index"
end
