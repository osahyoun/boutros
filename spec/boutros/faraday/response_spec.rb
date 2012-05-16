require 'helper'

describe Faraday::Response do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'client errors' do
    it "should raise 403 error" do
      stub_bad_request("/admin/api/accounts.xml", 403, 'response_403')

      lambda do
        @client.accounts
      end.should raise_error(Boutros::Error::Forbidden, "provider_key is invalid")
    end

    it "should raise 404 error" do
      stub_bad_request("/admin/api/accounts.xml", 404, '')

      lambda do
        @client.accounts
      end.should raise_error(Boutros::Error::NotFound)
    end

    it "should raise 422 error" do
      stub_bad_request("/admin/api/accounts.xml", 422, 'response_422')

      lambda do
        @client.accounts
      end.should raise_error(Boutros::Error::UnprocessableEntity, "System name can't be blank | System name is invalid")
    end
  end

  describe 'server errors' do
    it "should raise 500 error" do
      stub_bad_request("/admin/api/accounts.xml", 500, '')

      lambda do
        @client.accounts
      end.should raise_error(Boutros::Error::InternalServerError, "Something is wrong with 3scale")
    end

    it "should raise 502 error" do
      stub_bad_request("/admin/api/accounts.xml", 502, '')

      lambda do
        @client.accounts
      end.should raise_error(Boutros::Error::BadGateway, "3scale isn't available at the moment")
    end

    it "should raise 503 error" do
      stub_bad_request("/admin/api/accounts.xml", 503, '')

      lambda do
        @client.accounts
      end.should raise_error(Boutros::Error::ServiceUnavailable, "3scale isn't available at the moment")
    end

  end
end
