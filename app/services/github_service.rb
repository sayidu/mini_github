class GithubService
  class << self
    def repos(username)
      uri = uri_build("/users/#{username}/repos", query: nil)
      Net::HTTP.get_response(uri)
    end

    def create_repo(repo_params)
      uri = uri_build('/user/repos')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = repo_params.to_json
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
    end

    def get_repo(ownership_info)
      uri = uri_build("/repos/#{ownership_info[:owner]}/#{ownership_info[:repo]}")
      Net::HTTP.get_response(uri)
    end

    def delete_repo(ownership_info)
      uri = uri_build("/repos/#{ownership_info[:owner]}/#{ownership_info[:repo]}")
      req = Net::HTTP::Delete.new(uri)
      Net::HTTP.new(github_client.to_s).request(req)
    end

    def transfer_repo(ownership_info, transfer_params)
      uri = uri_build("/repos/#{ownership_info[:owner]}/#{ownership_info[:repo]}/transfer")
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

    def uri_build(path, query: "access_token=#{access_token}")
      URI::HTTPS.build(host: github_client, path: path, query: query)
    end
  end
end
