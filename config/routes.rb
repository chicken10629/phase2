Rails.application.routes.draw do
  resources :users, only: [:show, :edit]
  resources :post_images, only: [:new, :index, :show, :create, :destroy]
  #Userモデルを作成した時点で以下が作成
  #deviseを使用する際、URLにusersを含む
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/about' => 'homes#about', as: 'about'
end
