class GithubCaller
  class << self
    def public_repos_url_for(username)
      "#{github_client}/users/#{username}/repos"
    end

    private

    def github_client
      ENV['GITHUB_API_HOST']
    end
  end
end
