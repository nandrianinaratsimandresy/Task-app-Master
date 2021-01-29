Rails.application.routes.draw do
  
  resources :sessions
  resources :users, only:[:new, :create, :show]
  resources :tasks
  root 'sessions#new'
  namespace :admin  do
    resources  :users ,  Only: [:index ,  :new ,  :create ,  :show ,   :edit ,  :destroy]
  end

end
