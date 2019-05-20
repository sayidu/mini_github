class GithubService
  class << self
    def repos(username)
      uri = URI("#{github_client}/users/#{username}/repos")
      Net::HTTP.get_response(uri)
    end

    def create(access_token)
      URI("#{github_client}/user/repos?access_token=#{access_token}")
    end

    private

    def github_client
      ENV['GITHUB_API_HOST']
    end
  end
end
