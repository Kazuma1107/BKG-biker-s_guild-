Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  resources :post_recruitments, only: [:new, :create, :index, :show, :destroy] do
   resources :post_comments,    only: [:create, :destroy]
  end
    
  resources :post_images,       only: [:new, :create, :index, :show, :destroy] do
     resource :favorites,        only: [:create, :destroy]
  end
  
  
  resources :users,             only: [:index,:show, :edit, :update] do
    resource :relationships,only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end


  get 'home/about' => 'homes#about' , as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
