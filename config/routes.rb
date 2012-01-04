Dfine::Application.routes.draw do
  devise_for :users

  namespace :admin do
    root :to => "case_studies#index"
    resources :case_studies
    resources :images
    resources :users
  end
  
  namespace :api do
    resources :case_studies
  end
  
  root :to => "admin/case_studies#index"

end
