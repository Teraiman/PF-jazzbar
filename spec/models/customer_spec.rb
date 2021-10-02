# frozen_string_literal: true

require 'rails_helper'

describe 'customerモデルのテスト' do
  it "有効な内容の場合は保存されるか" do
    expect(FactoryBot.build(:customer)).to be_valid
  end
end


  # validates :name, presence: true
  # validates :name_kana, presence: {message: 'カタカナで入力して下さい。'}, format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/ }
  # validates :postal_cord, presence: {message: '7桁で入力してください。'}, format: { with: /\A\d{7}\z/ }
  # validates :address, presence: true
  # validates :telephone_number,  presence: {message: '10桁もしくは11桁で入力してください。'}, format: { with: /\A\d{10,11}\z/ }