Rails.application.routes.draw do
  get 'end_users/show'
  devise_for :admin_users, controllers: {
  	sessions: 'admin_users/sessions',
  	passwords: 'admin_users/passwords',
  	registrations: 'admin_users/registrations'
  }
  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations',
    omniauth_callbacks: 'end_users/omniauth_callbacks'
  }

  resources :end_users, :only => [:show]

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  get 'index' => 'messages#index'
  post 'confirm' => 'messages#confirm'
  post 'done' => 'messages#done'

  get 'about' => 'posts#about'
  get 'about_top' => 'posts#about_top'
  get 'comment_admin' => 'posts#show'
  post 'posts/:post_id/post_comments' => 'post_comments#create'

  get '3.115.91.101' => 'posts#about_top'
end
