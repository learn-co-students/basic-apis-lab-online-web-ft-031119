class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a45646b0eb30e73779c2'
      req.params['client_secret'] = '1a00d1ac39594a01dd6b62f1107db041690db04b'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@response.body)

    @repositories = body_hash["items"]

    render 'search'
  end
end
