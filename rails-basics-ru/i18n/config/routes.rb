# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'home#index'

  scope '/(:locale)', locale: /en|ru/ do
    resources :posts do
      resources :comments, module: :posts
    end
  end
  # END
end
