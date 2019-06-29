class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "f80b8c97c561679c6a59"
    client_secret = "c605b80091d7222c21b3256fb339b0038ad7d03b"

    resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
