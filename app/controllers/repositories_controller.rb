class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "should not have"
    client_secret = "submitted this"

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
