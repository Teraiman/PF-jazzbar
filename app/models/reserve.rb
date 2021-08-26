class Reserve < ApplicationRecord
  belongs_to :customer
  belongs_to :schedule

  validates :count, presence: true
  validates_uniqueness_of :schedule_id, scope: :customer_id
  # バリデーション（会員とスケジュールの組み合わせは一意）
  # 同じライブを複数回予約させないため。
end
