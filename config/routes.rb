Rails.application.routes.draw do
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match "/", to: "home#welcome", via: :get
end
