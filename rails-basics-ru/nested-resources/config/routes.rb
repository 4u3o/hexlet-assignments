# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  scope shallow_path: :posts, shallow_prefix: :post do
    resources :posts do
      resources :comments, shallow: true, module: :posts, except: :index
    end
  end

  # resources :posts do
  #   resources :comments, module: :posts
  # end
  # END
end
