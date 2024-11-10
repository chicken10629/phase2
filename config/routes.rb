Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    resource :favorite, only: [:create, :destroy]
    #resourceにすると、/:idがURLに含まれなくなる
    #必要なのはユーザーidとimageidだけなため
    resources :post_comments, only: [:create, :destroy]
  end
  #post_imagesとpost_commentsが親子関係になる
  #Userモデルを作成した時点で以下が作成
  #deviseを使用する際、URLにusersを含む
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/about' => 'homes#about', as: 'about'
end
