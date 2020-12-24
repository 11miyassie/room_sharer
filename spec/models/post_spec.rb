require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '物件投稿' do
    context '物件投稿がうまくいくとき' do
      it do
        expect(@post).to be_valid
      end
    end

    context '物件投稿がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it 'explainが空だと登録できない' do
        @post.explain = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Explain can't be blank")
      end

      it 'localが空だと登録できない' do
        @post.local = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Local can't be blank")
      end

      it 'localが21文字以上だと登録できない' do
        @post.local = 'aaaaaaaaaaaaaaaaaaaaa'
        @post.valid?
        expect(@post.errors.full_messages).to include('Local is too long (maximum is 20 characters)')
      end

      it 'prefecture_idが空だと登録できない' do
        @post.prefecture_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'priceが空だと登録できない' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが1000000以上だと登録できない' do
        @post.price = 1_000_000
        @post.valid?
        expect(@post.errors.full_messages).to include('Price must be less than or equal to 999999')
      end

      it 'buildingが空だと登録できない' do
        @post.building = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Building can't be blank")
      end

      it 'buildingが21文字以上だと登録できない' do
        @post.building = 'aaaaaaaaaaaaaaaaaaaaa'
        @post.valid?
        expect(@post.errors.full_messages).to include('Building is too long (maximum is 20 characters)')
      end

      it 'imageが空だと登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
# bundle exec rspec spec/models/post_spec.rb
