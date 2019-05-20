require 'rails_helper'

describe Api::V1::ReposController do
  describe '#index' do
    before { get "/users/#{username}/repos" }

    context 'user has public repos' do
      get :index

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
