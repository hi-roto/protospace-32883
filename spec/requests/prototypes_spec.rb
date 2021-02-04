require 'rails_helper'

RSpec.describe "prototypes", type: :request do
  before do
    @prototype = FactoryBot.create(:prototype)
  end
  
  describe "GET /index" do
    it "indexにアクションにリクエストすると正常にレスポンスが返ってってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する' do 
       get root_path
       expect(response.body).to include @prototype.title
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのキャッチコピーが存在する' do 
       get root_path
       expect(response.body).to include @prototype.catch_copy
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの画像URLが存在する' do 
       get root_path
       expect(response.body).to include "test_image.png"
    end
  end
  
  describe 'GET /show' do
      it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
        get prototype_path(@prototype.id)
        expect(response.status).to eq 200
      end
      it 'showアクションにリクエストするとレスポンスに保存済みのタイトルが存在する' do 
        get prototype_path(@prototype.id)
        expect(response.body).to include @prototype.title
      end
      it 'showアクションにリクエストするとレスポンスに保存済みのキャッチコピーが存在する' do 
        get prototype_path(@prototype.id)
        expect(response.body).to include @prototype.catch_copy
      end
      it 'showアクションにリクエストするとレスポンスに保存済みのコンセプトが存在する' do 
        get prototype_path(@prototype.id)
        expect(response.body).to include @prototype.concept
      end
      it 'showアクションにリクエストするとレスポンスに保存済みの画像URLが存在する' do 
        get prototype_path(@prototype.id)
        expect(response.body).to include "test_image.png"
      end
      it 'showアクションにリクエストするとレスポンスにコメント一覧の要素が存在する' do 
        get prototype_path(@prototype.id)
        expect(response.body).to include "prototype__comments"
      end
  end 
  
end
