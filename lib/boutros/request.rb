module Boutros
  # Defines HTTP request methods
  module Request
    # Perform an HTTP DELETE request
    def delete(path, params={}, options={})
      request(:delete, path, params, options)
    end

    # Perform an HTTP GET request
    def get(path, params={}, options={})
      request(:get, path, params, options)
    end

    # Perform an HTTP POST request
    def post(path, params={}, options={})
      request(:post, path, params, options)
    end

    # Perform an HTTP PUT request
    def put(path, params={}, options={})
      request(:put, path, params, options)
    end

  private

    # Perform an HTTP request
    def request(method, path, params, options)
      response = connection(options).run_request(method, nil, nil, nil) do |request|
        params.merge!({:provider_key => key})
        case method.to_sym
        when :delete, :get
          request.url(path, params)
        when :post, :put
          request.path = path
          request.body = params unless params.empty?
        end
      end
      response.body
    end

  end
end
