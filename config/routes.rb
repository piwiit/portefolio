Rails.application.routes.draw do
  resources :messages, only: %i[new create] do
    post 'contact_mailer'
  end

  resources :languages
  resources :projects
  devise_for :users
  root 'projects#index' # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
