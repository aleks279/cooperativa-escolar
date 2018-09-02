require 'rails_helper'

describe 'User requests', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /admin/users' do
    it 'gets all the users' do
      get admin_users_path
      expect(response).to be_successful
    end
  end

  describe 'GET /admin/users/:user_id' do
    it 'gets the correct user' do
      get admin_user_path(user)
      expect(assigns[:user]).to eq(user)
    end
  end

  describe 'GET /admin/users/new' do
    it 'render the template for new user' do
      get new_admin_user_path
      expect(response).to be_successful
    end

    it 'initializes the new user' do
      get new_admin_user_path
      expect(assigns[:user]).to be_a_new(User)
    end
  end

  describe 'POST /admin/users' do
    describe 'with valid attributes' do
      let(:valid_attributes) do
        { user: attributes_for(:user) }
      end

      it 'creates the new user' do
        expect {
          post admin_users_path, params: valid_attributes
        }.to change(User, :count).by(1)
      end

      it 'redirects to the user profile page' do
        post admin_users_path, params: valid_attributes
        expect(response).to redirect_to admin_user_path(assigns[:user])
      end
    end

    describe 'with invalid attributes' do
      let(:invalid_attributes) do
        { user: attributes_for(:user, password: '', password_confirmation: '') }
      end

      it 're-renders the new user template' do
        post admin_users_path, params: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET /admin/users/:user_id/edit' do
    it 'render the template for edit user' do
      get edit_admin_user_path(user)
      expect(response).to be_successful
    end

    it 'initializes the new user' do
      get edit_admin_user_path(user)
      expect(assigns[:user]).to eq(user)
    end
  end

  describe 'PUT /admin/users/:user_id' do
    let(:existing_user) { create(:user) }

    describe 'with valid attributes' do
      let(:params) {
        {
          user: {
            first_name: 'New name',
            last_name: 'New last name',
          }
        }
      }

      it 'updates the user' do
        put admin_user_path(existing_user), params: params
        expect(existing_user.reload).to have_attributes(params[:user])
      end

      it 'redirects to the user profile page' do
        put admin_user_path(existing_user), params: params
        expect(response).to redirect_to admin_user_path(existing_user)
      end
    end

    describe 'with invalid attributes' do
      let(:params) {
        {
          user: {
            first_name: '',
            last_name: '',
          }
        }
      }

      it 're-renders the edit user template' do
        put admin_user_path(existing_user), params: params
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE /admin/users/:user_id' do
    let!(:deletable_user) { create(:user) }

    it 'succeeds' do
      expect {
        delete admin_user_path(deletable_user)
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the user index page' do
      delete admin_user_path(deletable_user)
      expect(response).to redirect_to admin_users_path
    end
  end
end
