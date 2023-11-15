Rails.application.routes.draw do
  resources :orgs
  resources :orgs do 

  resources :weekly_plans do 
    get :settings, on: :member
  end 
end 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
