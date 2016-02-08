Rails.application.routes.draw do
 
  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy' 

  namespace :admin do
    resources :posts
    resources :comments, only: [:index, :update, :destroy]
    resources :tags, except: [:index]
    resources :moderators, only: [:index, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :posts
  end

end
