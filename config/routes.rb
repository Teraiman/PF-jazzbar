Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :admins
  devise_for :admins, module: "admins"
  # devise_for :customers
  devise_for :customers, module: "customers"

  ########## 会員 ##########
scope module: :customer do
  # 会員/ホーム
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: 'about'
    get 'homes/access', to: 'homes#access', as: 'access'

  #会員/会員
    get 'customers/quit', to: 'customers#quit'
    get 'customers/quitcheck', to: 'customers#quitcheck'
    resources :customers, only: [:show, :edit]

  #会員/予約
    get 'reserves/finish', to: 'reserves#finish'
    resources :reserves, only: [:new, :index, :show]

  #会員/スケジュール
    get 'schedules/index_list'
    resources :schedules, only: [:index, :show]

  #会員/インフォメーション
    resources :informations, only: [:index, :show]

  #会員/アーティスト
    resources :artists, only: [:index]

  #会員/ハウスルール
    get 'house_rules/index'

  #notification項目の有無？
end
  ########## 会員 ##########

  ########## 管理者 ##########
  namespace :admin do

  #管理者/会員
    get 'customers/edit_memo', to: 'customers#edit_memo'
    resources :customers, only: [:index, :show, :edit]

  #管理者/ホーム
    get 'homes/top', to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: 'about'
    get 'homes/access', to: 'homes#access', as: 'access'

  #管理者/スケジュール
    get 'schedules/index_list', to: 'schedules#index_list'
    resources :schedules, only: [:new, :index, :show, :edit]

  #管理者/アーティスト
    resources :artists, only: [:index, :edit]

  #管理者/予約
    resources :reserves, only: [:new, :index, :show, :edit]

  #管理者/インフォメーション
    resources :informations, only: [:new, :index, :show, :edit]

  #管理者/ハウスルール

  end
  ########## 管理者 ##########
end
