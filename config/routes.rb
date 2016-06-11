Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :users, only: [:create, :destroy, :update]
        post 'like' => 'likes#like'
        get 'mis_likes' => 'mis_likes#like'
        post 'vote' => 'votes#vote'
        get 'user/:id' => 'users#show'
        post 'search' => 'search#search'
        post 'login' => 'sessions#create'
        get 'welcome' => 'welcome#index'
        get 'visited' => 'tales#visitados'
        get 'ranking' => 'tales#ranking'
        post 'reset' => 'reset_password#reset'
        post 'verificar' => 'reset_password#verificar_cod'
        post 'change_password' => 'reset_password#change_password'
    end
  end
end
