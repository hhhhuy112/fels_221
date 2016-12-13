class SearchSuggestions
  def initialize app
    @app = app
  end

  def call env
    if env[Settings.middleware.path_info] == Settings.middleware.path
      request = Rack::Request.new env
      terms = SearchSuggestion.terms_for request.params[Settings.middleware.params]
      [Settings.middleware.respone_code, 
        {Settings.middleware.content_type => Settings.middleware.type}, [terms.to_json]]
    else
      @app.call env
    end
  end
end
