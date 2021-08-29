class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :artist

  validates_uniqueness_of :artist_id, scope: :customer_id
  # バリデーション（会員とアーティストの組み合わせは一意）
  # 同じアーティストを複数回お気に入り登録させないため。
end
