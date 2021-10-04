# frozen_string_literal: true

require 'rails_helper'

describe 'customerモデルのテスト' do
  it "有効な内容の場合は保存されるか" do
    expect(FactoryBot.build(:customer)).to be_valid
  end
end
