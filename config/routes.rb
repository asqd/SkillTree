Rails.application.routes.draw do
  devise_for :users
  resources :link_specialty_disciplines
  resources :specialties
  resources :disciplines

  get 'disciplines/by_specialty/:id' => 'disciplines#by_specialty'

  root 'index#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/specialties/:id' => 'specialties#show'
  get '/specialties/compare/:id/:comparison_id' => 'specialties#compare'

  namespace :api do
    resources :specialties do
      get 'disciplines', on: :member
      get 'group_list', on: :collection
      get :search, on: :collection
    end
    get 'disciplines' => 'disciplines#index'
    get 'disciplines/compare' => 'disciplines#compare'
  end
end
