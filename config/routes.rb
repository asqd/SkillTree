Rails.application.routes.draw do
  resources :link_specialty_disciplines
  resources :specialties
  resources :disciplines

  root 'specialties#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
