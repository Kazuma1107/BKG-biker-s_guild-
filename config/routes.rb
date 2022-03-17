Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about' , as: 'about'
  
  resources :post_recruitments, only: [:new, :create, :index, :show, :destroy] do
   resources :post_comments,    only: [:create, :destroy]
  end
    
  resources :post_images,       only: [:new, :create, :index, :show, :destroy] do
     resource :favorites,        only: [:create, :destroy]
  end
  
  resources :post_comments,only: [:new]
  
  resources :users,             only: [:index,:show, :edit, :update] do
    resource :relationships,only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :groups,only: [:new, :index,  :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
  end
  
  get '/search',to: 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
