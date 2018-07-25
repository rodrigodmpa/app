Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :sites
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
