class GithubCaller
  class << self
    def public_repos_url_for(username)
      URI("#{github_client}/users/#{username}/repos")
    end

    def create_repo_for_(access_token)
      URI("#{github_client}/user/repos?access_token=#{access_token}")
    end

    private

    def github_client
      ENV['GITHUB_API_HOST']
    end
  end
end
