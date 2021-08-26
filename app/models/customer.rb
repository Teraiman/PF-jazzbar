class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :reserves, dependent: :destroy
  has_many :schedules, through: :reserves
  has_many :artists, through: :favorites


  validates :name, presence: true
  validates :name_kana, presence: {message: 'カタカナで入力して下さい。'}, format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/ }
  validates :postal_cord, presence: {message: '7桁で入力してください。'}, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :telephone_number,  presence: {message: '10桁もしくは11桁で入力してください。'}, format: { with: /\A\d{10,11}\z/ }
  # validates :memo, presence: true



  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
