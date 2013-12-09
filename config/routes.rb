Blocmarks::Application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end

    
  match "about" => 'welcome#about', via: :get


  root :to => 'welcome#index'

end
