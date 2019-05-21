class GithubService
  class << self
    def repos(username)
      uri = URI("#{github_client}/users/#{username}/repos")
      Net::HTTP.get_response(uri)
    end

    def create_repo(repo_params)
      uri = URI("#{github_client}/user/repos?access_token=#{access_token}")
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = repo_params.to_json
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
    end

    def get_repo(ownership_info)
      Net::HTTP.get_response(ownership_uri(ownership_info))
    end

    def delete_repo(ownership_info)
      req = Net::HTTP::Delete.new(ownership_uri(ownership_info))
      Net::HTTP.new(github_client.to_s).request(req)
    end

    def transfer_repo(ownership_info, transfer_params)
      uri = URI("#{github_client}/repos/#{ownership_info[:owner]}/#{ownership_info[:repo]}/transfer?access_token=#{access_token}")
      req = Net::HTTP::Post.new(uri,
                                'Content-Type' => 'application/json',
                                'Accept' => 'application/vnd.github.nightshade-preview+json',
                                'X-GitHub-Media-Type' => 'github.v3')
      req.body = transfer_params.to_json
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
    end

    private

    def github_client
      ENV['GITHUB_API_HOST']
    end

    def access_token
      ENV['USER_ACCESS_TOKEN']
    end

    def ownership_uri(ownership_info)
      URI("#{github_client}/repos/#{ownership_info[:owner]}/#{ownership_info[:repo]}?access_token=#{access_token}")
    end
  end
end
