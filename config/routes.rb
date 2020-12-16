Rails.application.routes.draw do
  resources :languages
  resources :projects
  devise_for :users
  root 'projects#index' # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
