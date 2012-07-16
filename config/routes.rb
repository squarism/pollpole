Pollpole::Application.routes.draw do
  resources :race
  resources :delayed_job
  match 'race/new/:id' => 'race#new'
  root :to => 'race#index'
end
