require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype) 
  end

  describe "プロトタイプ投稿機能" do
    context "投稿できるとき" do
      it "すべての項目に入力がある場合は投稿できる" do
        expect(@prototype).to be_valid 
      end
    end  
    context "投稿できないとき" do
      it "titleが空の時" do
        @prototype.title = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include "Title can't be blank"
      end
      it "catch_copyが空の時" do
        @prototype.catch_copy = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include "Catch copy can't be blank"
      end
      it "conceptが空の時" do
        @prototype.concept = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include "Concept can't be blank"
      end
      it "imageが空の時" do
        @prototype = Prototype.new(title: 'test', catch_copy: 'test', concept: 'test')
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include "Image can't be blank"
      end
    end
  
  end

end
