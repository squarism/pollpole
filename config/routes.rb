Pollpole::Application.routes.draw do
  match 'race/new/:id' => 'race#new'
  match 'race/delete_all' => 'race#delete_all', :as => 'delete_scores'
  resources :race
  resources :delayed_job
  resources :faye
  root :to => 'race#index'
end
