Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :shops do
    collection do
      post 'likes'
    end
  end

  resources :shops do
    collection do
      post 'remove_from_preferred'
    end
  end

  get 'preferred_shops' => "shops#preferred_shops"
  root to: 'shops#index'
end
