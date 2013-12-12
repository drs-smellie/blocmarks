Blocmarks::Application.routes.draw do

  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  resources :sessions

  resources :users
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
    end
  end

    
  match "about" => 'welcome#about', via: :get


  root :to => 'welcome#index'

end
