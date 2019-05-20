require 'rails_helper'

describe Api::V1::ReposController do
  describe '#index' do
    context 'user has public repos' do
      uri = URI("#{ENV['GITHUB_API_HOST']}/users/jane/repo")

      response = Net::HTTP.get(uri)

      it 'returns the response as a string' do
        expect(response).to be_an_instance_of(String)
      end
    end
  end
end
