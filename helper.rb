require 'boutros'
require 'rspec'
require 'webmock/rspec'
require 'json'
require 'nori'

module HelperMethods
  def stub_get(path, file, params={})
    stub_request(:get, @client.domain + path).
      with(:query => {:provider_key => @client.key}.merge!(params)).
      to_return(:body => fixture(file.to_s), :headers => {:content_type => "application/xml; charset=utf-8"})
  end

  def stub_post(path, file, params={})
    stub_request(:post, @client.domain + path).
      with(:body => {:provider_key => @client.key}.merge!(params)).
      to_return(:body => fixture(file.to_s), :headers => {:content_type => "application/xml; charset=utf-8"})
  end

  def stub_put(path, file, params={})
    stub_request(:put, @client.domain + path).
    with(:body => {:provider_key => @client.key}.merge!(params)).
      to_return(:body => fixture(file.to_s), :headers => {:content_type => "application/xml; charset=utf-8"})
  end

  def stub_delete(path, file)
    stub_request(:delete, @client.domain + path).with(:query => {:provider_key => @client.key}).
      to_return(:body => fixture(file.to_s), :headers => {:content_type => "application/xml; charset=utf-8"})
  end

  def stub_bad_request(path, status, file = '')
    stub_request(:get, @client.domain + path).
      with(:query => {:provider_key => @client.key}).
      to_return(:status => status, :body => fixture(file))
  end

  def client_options
    {
      :domain => "http://example.com",
      :key => '000-111-xxx-yyy'
    }
  end
end


def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  return '' if file.empty?
  file = file.split('.').size > 1 ? file : "#{file}.xml"
  File.new(fixture_path + '/' + file)
end


