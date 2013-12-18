module Request
  def get(path)
    request(:get, path)
  end

  def post(path, options)
    request(:post, path, options)
  end

  private

  def request(method, path, options = {})
    response = connection.send(method) do |request|
      request.url path
      request.body = options if method == :post
    end

    Response.create(response)
  end
end
