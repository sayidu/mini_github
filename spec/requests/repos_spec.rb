require 'rails_helper'

describe Api::V1::ReposController do
  let(:headers) { { 'Accept': '*/*', 'User-Agent': 'Ruby' } }

  describe '#index' do
    before do
      stub_request(:get, ENV['GITHUB_API_HOST'])
        .with(headers: headers).to_return(
          status: :ok, body: 'stubbed response'
        )
    end

    context "when listing a user's public repos" do
      uri = URI("#{ENV['GITHUB_API_HOST']}/users/jane/repo")

      response = Net::HTTP.get(uri)

      it 'returns the response as a string' do
        expect(response).to be_an_instance_of(String)
      end

      it 'returns the response as a string' do
        expect(response.status).to eq('200')
      end
    end
  end

  describe '#create' do
    before do
      stub_request(:post, ENV['GITHUB_API_HOST']).with(
        headers: headers,
        params: { name: 'Testing Repo' }
      ).to_return(
        status: 200, body: 'stubbed response', headers: {}
      )
    end

    context 'when a user creates a new repo' do
      uri = URI("#{ENV['GITHUB_API_HOST']}/users/jane/repo")

      response = Net::HTTP.get(uri)

      it 'returns the response as a string' do
        expect(response).to be_an_instance_of(String)
      end
    end
  end
end
