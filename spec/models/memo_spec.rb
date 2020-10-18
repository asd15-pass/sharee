require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe '#create' do
    before do
      @memo = FactoryBot.build(:memo)
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@memo).to be_valid
    end

    it 'contentが空でも保存できること' do
      @memo.content = nil
      expect(@memo).to be_valid
    end

    it 'imageが空でも保存できること' do
      @memo.image = nil
      expect(@memo).to be_valid
    end

    it 'contentとimageが空では保存できないこと' do
      @memo.content = nil
      @memo.image = nil
      @memo.valid?
      expect(@memo.errors.full_messages).to include("Content can't be blank")
    end

    it 'roomが紐付いていないと保存できないこと' do
      @memo.room = nil
      @memo.valid?
      expect(@memo.errors.full_messages).to include("Room must exist")
    end

    it 'userが紐付いていないと保存できないこと' do
      @memo.user = nil
      @memo.valid?
      expect(@memo.errors.full_messages).to include("User must exist")
    end
  end
end
