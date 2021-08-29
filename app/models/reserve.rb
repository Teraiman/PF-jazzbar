class Reserve < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin, optional: true
  belongs_to :schedule

  validates :count, presence: true
  validates_uniqueness_of :schedule_id, scope: :customer_id, if: :has_customer_id?
  # バリデーション（会員とスケジュールの組み合わせは一意）
  # 同じライブを複数回予約させないため。

  def has_customer_id?
    customer_id.present?
  end
end
