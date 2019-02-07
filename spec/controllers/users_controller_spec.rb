# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:user).slice(:first_name, :last_name, :email, :password)
  }

  let(:invalid_attributes) {
    { first_name: nil, last_name: nil, email: nil, password: nil }
  }

  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
      subject = create(:user, valid_attributes)
      get :show, session: valid_session
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post :create, params: {
            user: valid_attributes
          }, session: valid_session
        }.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')

        last_user = User.last
        expect(last_user.first_name).to be_eql(valid_attributes[:first_name])
        expect(last_user.last_name).to be_eql(valid_attributes[:last_name])
        expect(last_user.email).to be_eql(valid_attributes[:email])
        expect(last_user.authenticate(valid_attributes[:password])).to_not \
          be_nil
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user' do
        post :create, params: {
          user: invalid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')

        json_body = JSON.parse(response.body)
        %w[first_name last_name email password].each do |attr|
          expect(json_body[attr]).to include("can't be blank")
        end
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:user).slice(:first_name, :last_name, :email, :password)
      }

      it 'updates the requested user' do
        subject = create(:user, valid_attributes)
        put :update, params: {
          id: subject.to_param,
          user: new_attributes
        }, session: valid_session
        subject.reload

        expect(subject.first_name).to be_eql(new_attributes[:first_name])
        expect(subject.last_name).to be_eql(new_attributes[:last_name])
        expect(subject.email).to be_eql(new_attributes[:email])
      end

      it 'renders a JSON response with the user' do
        subject = create(:user, valid_attributes)

        put :update, params: { user: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the user' do
        subject = create(:user, valid_attributes)

        put :update, params: {
          user: invalid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      create(:user, valid_attributes)
      expect { delete :destroy, session: valid_session }.to \
        change(User, :count).by(-1)
    end
  end
end
