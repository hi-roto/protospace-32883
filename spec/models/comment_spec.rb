require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメント投稿機能" do
    context "投稿できるとき" do
      it "コメントが入力されている" do
        expect(@comment).to be_valid
      end
    end
    context "投稿できないとき" do
      it "コメント欄が空のとき" do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Text can't be blank"
      end
    end
  end
  end
