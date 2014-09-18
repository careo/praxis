require 'pp'
require 'json'

require 'bundler/setup'

require 'pry'

$:.unshift File.expand_path('lib', __dir__)

require 'praxis'

require 'reel'

application = Praxis::Application.instance

application.setup

class Praxis::ReelRequest < Praxis::Request
  attr_reader :reel_request

  def initialize(request)
    @reel_request = request
    @query = Rack::Utils.parse_nested_query(@reel_request.query_string)
    @route_params = {}
    load_version
  end

  def content_type
    @reel_request.headers['Content-Type'.freeze]
  end

  def raw_headers
    @reel_request.headers
  end

  def load_version
    @version = raw_headers.fetch("X-API-Version".freeze,
                             @query.fetch('api_version'.freeze, 'n/a'.freeze))
  end

  def verb
    @reel_request.method
  end

  def path
    @reel_request.path
  end

  def raw_payload
    @raw_payload ||= begin
      @reel_request.body.to_s
    end
  end

  #def validate_headers(context)
  #  return []
  #end

  def load_headers(context)
    return unless action.headers
    defined_headers = action.headers.attributes.keys.each_with_object(Hash.new) do |name, hash|
      hash[name] = raw_headers[name] if raw_headers.headers.key? name
    end

    binding.pry
    self.headers = action.headers.load(defined_headers, context)
  end


end


Reel::Server::HTTP.run('127.0.0.1', 3000) do |connection|
  connection.each_request do |request|
    req = Praxis::ReelRequest.new(request)
    status, headers,body = application.call(req)

    response = Reel::Response.new(status, body)
    request.respond response
  end
end
