# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な内容の場合は保存されるか" do
      expect(FactoryBot.build(:customer)).to be_valid
    end
  end

  context "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      customer = Customer.new(name: '',
                              name_kana: 'ホゲ',
                              email: 'hoge@hoge',
                              postal_cord: '0000000',
                              address: 'hogehoge',
                              telephone_number: '00000000000',
                              is_deleted: 'true',
                              password: '000000'
                              )
      expect(customer).to be_invalid
      expect(customer.errors[:name]).to include("can't be blank")
    end
    it "name_kanaが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      customer = Customer.new(name: 'hoge',
                              name_kana: '',
                              email: 'hoge@hoge',
                              postal_cord: '0000000',
                              address: 'hogehoge',
                              telephone_number: '00000000000',
                              is_deleted: 'true',
                              password: '000000'
                              )
      expect(customer).to be_invalid
      expect(customer.errors[:name_kana]).to include("カタカナで入力して下さい。", "is invalid")
    end
    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      customer = Customer.new(name: 'hoge',
                              name_kana: 'ホゲ',
                              email: '',
                              postal_cord: '0000000',
                              address: 'hogehoge',
                              telephone_number: '00000000000',
                              is_deleted: 'true',
                              password: '000000'
                              )
      expect(customer).to be_invalid
      expect(customer.errors[:email]).to include("can't be blank")
    end
    it "postal_cordが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      customer = Customer.new(name: 'hoge',
                              name_kana: 'ホゲ',
                              email: 'hoge@hoge',
                              postal_cord: '',
                              address: 'hogehoge',
                              telephone_number: '00000000000',
                              is_deleted: 'true',
                              password: '000000'
                              )
      expect(customer).to be_invalid
      expect(customer.errors[:postal_cord]).to include("7桁で入力してください。", "is invalid")
    end
    it "addressが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      customer = Customer.new(name: 'hoge',
                              name_kana: 'ホゲ',
                              email: 'hoge@hoge',
                              postal_cord: '0000000',
                              address: '',
                              telephone_number: '00000000000',
                              is_deleted: 'true',
                              password: '000000'
                              )
      expect(customer).to be_invalid
      expect(customer.errors[:address]).to include("can't be blank")
    end
    it "telephone_numberが空白の場合にバリデーションチェックされエラーメッセージが返ってきているか" do
      customer = Customer.new(name: 'hoge',
                              name_kana: 'ホゲ',
                              email: 'hoge@hoge',
                              postal_cord: '0000000',
                              address: 'hogehoge',
                              telephone_number: '',
                              is_deleted: 'true',
                              password: '000000'
                              )
      expect(customer).to be_invalid
      expect(customer.errors[:telephone_number]).to include("10桁もしくは11桁で入力してください。", "is invalid")
    end
    it "passwordが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      customer = Customer.new(name: 'hoge',
                              name_kana: 'ホゲ',
                              email: 'hoge@hoge',
                              postal_cord: '0000000',
                              address: 'hogehoge',
                              telephone_number: '00000000000',
                              is_deleted: 'true',
                              password: ''
                              )
      expect(customer).to be_invalid
      expect(customer.errors[:password]).to include("can't be blank")
    end
  end
end
