Rails.application.routes.draw do
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

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

end
