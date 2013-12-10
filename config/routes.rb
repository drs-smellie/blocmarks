Blocmarks::Application.routes.draw do

  resources :users
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions

  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
    end
  end

    
  match "about" => 'welcome#about', via: :get


  root :to => 'welcome#index'

end
