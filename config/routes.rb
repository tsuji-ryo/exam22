Rails.application.routes.draw do





  get 'relationships/create'

  get 'relationships/destroy'

if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}


  resources :users, only: [:index,:show]
  resources :conversations do
    resources :messages
  end
  resources :relationships, only: [:create, :destroy]
  resources :topics, only: [:index, :new, :create, :edit, :update, :destroy, :show] do collection do
    post :confirm
    end
  end
  resources :topic do
    resources :comments
    post :confirm, on: :collection
  end

  resources :pictures


  root 'top#index'
end
