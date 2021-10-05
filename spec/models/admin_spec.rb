# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:admin)).to be_valid
    end
  end

  # context "空白のバリデーションチェック" do
  #   it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
  #     admin = Admin.new(email: '', password: '000000')
  #     expect(admin).to be_valid
  #     expect(admin.errors[:email]).to include("can't be blank")
  #   end
  #   it "passwordが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
  #     admin = Admin.new(email: 'hoge@hoge', password: '')
  #     expect(admin).to be_valid
  #     expect(admin.errors[:password]).to include("can't be blank")
  #   end
  # end
end