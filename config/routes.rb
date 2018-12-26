Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user do
  end

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  root 'welcome#welcome'
end
