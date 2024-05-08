class MovieService

  def conn
    @conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.header["X-API-Key"] = Rails.application.credentials.the_movie_db[:key]
    end
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end