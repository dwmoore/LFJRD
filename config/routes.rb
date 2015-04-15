Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :profiles

  # defaults to dashboard
  #root :to => redirect('/singleview')

  # view routes
  get '/singleview' => 'singleview#index'

  # api routes
  get '/api/i18n/:locale' => 'api#i18n'



end
