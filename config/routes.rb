Rails.application.routes.draw do
  resources :link_specialty_disciplines
  resources :union_specialty_disciplines
  resources :disciplines
  resources :assignment_specialty_disciplines
  resources :specialties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
