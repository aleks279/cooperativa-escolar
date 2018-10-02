require 'rails_helper'

describe 'Registry requests', type: :request do
  describe 'GET /admin/registries' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'gets all the registries' do
      get admin_registries_path
      expect(response).to be_successful
    end
  end

  describe 'GET /registries/new' do
    it 'renders the new registry template' do
      get new_registry_path
      expect(response).to be_successful
    end

    it 'initializes the new registry' do
      get new_registry_path
      expect(assigns[:registry]).to be_a_new(Registry)
    end
  end

  describe 'POST /registries' do
    describe 'with valid attributes' do
      let(:user) { create(:user) }
      let(:valid_attributes) do
        { registry: attributes_for(:registry) }.merge(id_number: user.id_number)
      end

      it 'creates the new registry' do
        expect {
          post registries_path, params: valid_attributes
        }.to change(Registry, :count).by(1)
      end
    end

    describe 'with invalid attributes' do
      let(:invalid_attributes) do
        { registry: attributes_for(:registry) }.merge(id_number: '2-333-444')
      end

      it 're-renders the new registry template' do
        post registries_path, params: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end
end
