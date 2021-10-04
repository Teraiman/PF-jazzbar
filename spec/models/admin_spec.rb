# frozen_string_literal: true

require 'rails_helper'

describe 'adminモデルのテスト' do
  it "有効な内容の場合は保存されるか" do
    expect(FactoryBot.build(:admin)).to be_valid
  end
end
