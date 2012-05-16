require 'helper'

describe Boutros::Client do
  include HelperMethods

  before do
    @client = Boutros::Client.new(client_options)
  end

  describe 'service' do

    it 'should be get-able' do
      stub_get('/admin/api/services/20.xml', :service)

      @client.service(20).should be_a Boutros::Service
    end

    it 'should be create-able' do
      body = {:name => 'Foo bar', :system_name => 'foo_bar'}
      stub_post('/admin/api/services.xml', :service, body)

      service = @client.create_service(body)
      service.should be_a Boutros::Service
    end

    it 'should be update-able' do
      body = {:name => 'Foo bar'}
      stub_put('/admin/api/services/20.xml', :service, body)

      service = @client.update_service(20, body)
      service.should be_a Boutros::Service
    end

    it 'should be delete-able' do
      stub_delete('/admin/api/services/20.xml', '')

      @client.delete_service(20).should be_empty
    end
  end

  describe 'services' do
    it 'should be get-able' do
     stub_get('/admin/api/services.xml', :services)

     @client.services.first.should be_a Boutros::Service
    end
  end


end