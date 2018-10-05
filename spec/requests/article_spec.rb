require 'rails_helper'

describe 'Article requests', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /articles' do
    it 'gets all the articles' do
      get articles_path
      expect(response).to be_successful
    end
  end

  describe 'GET /articles/:article_id' do
    let(:article) { create(:article, user: user) }
    let(:section) { create(:section, article: article) }

    it 'gets the article' do
      get article_path(article)
      expect(response).to be_successful
    end
  end

  describe 'GET /articles/new' do
    it 'renders the new article template' do
      get new_article_path
      expect(response).to be_successful
    end

    it 'initializes the new article' do
      get new_article_path
      expect(assigns[:article]).to be_a_new(Article)
    end
  end

  describe 'POST /articles' do
    describe 'with valid attributes' do
      let(:valid_attributes) do
        { article: attributes_for(:article,
                                  sections_attributes: [attributes_for(:section)]) }
      end

      it 'creates the new article' do
        expect {
          post articles_path, params: valid_attributes
        }.to change(Article, :count).by(1)
      end

      it 'redirects to the articles index view' do
        post articles_path, params: valid_attributes
        expect(response).to redirect_to articles_path
      end
    end

    describe 'with invalid attributes' do
      let(:invalid_params) do
        { article: attributes_for(:article, title: '') }
      end

      it 're-renders the new article template' do
        post articles_path, params: invalid_params
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET /articles/:article_id/edit' do
    let(:article) { create(:article, user: user) }
    let(:section) { create(:section, article: article) }

    it 'renders the edit article template' do
      get edit_article_path(article)
      expect(response).to be_successful
    end

    it 'initializes the article' do
      get edit_article_path(article)
      expect(assigns[:article]).to eq(article)
    end
  end

  describe 'PUT /articles/:article_id' do
    let(:article) { create(:article, user: user) }
    let(:section) { create(:section, article: article) }

    describe 'with valid attibutes' do
      let(:params) { { article: { title: 'new title' } } }

      it 'updates the article' do
        put article_path(article), params: params
        expect(article.reload).to have_attributes(params[:article])
      end

      it 'redirects to the article view' do
        put article_path(article), params: params
        expect(response).to redirect_to article_path(article)
      end
    end

    describe 'with invalid attributes' do
      let(:params) { { article: { title: '' } } }

      it 're-renders the edit article template' do
        put article_path(article), params: params
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE /articles/:article_id' do
    let!(:article) { create(:article, user: user) }
    let(:section) { create(:section, article: article) }

    it 'succeeds' do
      expect {
        delete article_path(article)
      }.to change(Article, :count).by(-1)
    end

    it 'redirects to the article index view' do
      delete article_path(article)
      expect(response).to redirect_to articles_path
    end
  end
end
