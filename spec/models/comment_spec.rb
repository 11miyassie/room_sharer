require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it "textが空だと登録できない" do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end