Rails.application.routes.draw do
  
  # rootをログイン画面に設定
  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'users/dash_boards', to: 'users#index' 

  resource :users do
      resources :articles
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
