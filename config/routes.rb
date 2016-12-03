Rails.application.routes.draw do
  devise_for :users
  # # Overide default devise controllers
  # devise_for :users, controllers: { registrations: 'registrations',
  #                                   sessions: 'sessions',
  #                                   confirmations: 'confirmations',
  #                                   unlocks: 'unlocks' }

  root 'static_pages#index'
end
